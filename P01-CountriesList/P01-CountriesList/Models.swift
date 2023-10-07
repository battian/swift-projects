//
//  Country.swift
//  P01-CountriesList
//
//  Created by battian on 05/10/23.
//

import Foundation

struct Country: Codable {
  let name: String
  let code: String
  let timezone: String
  let utc: String
  let mobileCode: String
}

struct Response: Codable {
  let data: [Country]
}
