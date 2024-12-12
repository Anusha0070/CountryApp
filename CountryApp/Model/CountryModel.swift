//
//  CountryModel.swift
//  CountryApp
//
//  Created by Anusha Raju on 12/12/24.
//

struct CountryModel: Codable{
    let capital: String?
    let code: String?
    let currency: Currency?
    let flag: String?
    let language: Language?
    let name: String?
    let region: String?
  }

struct Currency: Codable{
    let code: String?
    let name: String?
    let symbol: String?
}

struct Language: Codable{
    let code: String?
    let name: String?
}
