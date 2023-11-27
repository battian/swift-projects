//
//  Article.swift
//  P06-ArtInstitute
//
//  Created by Ana Battistini on 30/10/23.
//

import Foundation

struct Article: Codable {
  var id: Int
  var title: String
  var copy: String
}

struct Articles: Codable {
  var data: [Article]
}
