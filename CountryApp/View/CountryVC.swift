//
//  CountryVC.swift
//  CountryApp
//
//  Created by Anusha Raju on 12/12/24.
//

import UIKit

class CountryVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var countryTableView: UITableView!
    
    var countryViewModel = CountryVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countryTableView.dataSource = self
        countryTableView.delegate = self
        searchBar.delegate = self
        getData()
    }
    
    func getData(){
        countryViewModel.getCountryData(urlString: ServerConstants.serverURL)
        countryViewModel.onDataFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.countryTableView.reloadData()
            }
        }
    }
}

extension CountryVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryViewModel.getCountryCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CountryTableViewCell else{
            return UITableViewCell()
        }
        
        let countryDetails = countryViewModel.filteredCountry?[indexPath.row]
        if let countryDetails{
            cell.name.text = countryDetails.name
            cell.capital.text = countryDetails.capital
            cell.region.text = countryDetails.region
        }
        
        return cell
    }
}

extension CountryVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
    
extension CountryVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        countryViewModel.getFilteredCountries(searchText: searchText)
    }
}
