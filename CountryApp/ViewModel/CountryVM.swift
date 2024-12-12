//
//  CountryVM.swift
//  CountryApp
//
//  Created by Anusha Raju on 12/12/24.
//
import Foundation

class CountryVM{
    
    var networkManager: Network? = NetworkManager.sharedInstance
    var country: [CountryModel]?
    var onDataFetched: (() -> Void)?
    var filteredCountry: [CountryModel]?
    
    @MainActor
    func getCountryData(urlString: String){
        print("This is country")
        Task{
            do{
                let country: [CountryModel]? = try await networkManager?.fetchData(from: urlString)
                self.country = country
                self.filteredCountry = country
                onDataFetched?()
            } catch {
                print("Error : \(error)")
            }
        }
    }
    
    func getCountryCount() -> Int{
        return filteredCountry?.count ?? 0
    }
    
    func getFilteredCountries(searchText: String){
        if searchText.isEmpty {
            filteredCountry = country
        } else {
            filteredCountry = country?.filter {
                $0.name?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
        onDataFetched?()
    }
}
