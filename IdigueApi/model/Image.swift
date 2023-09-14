//
//  Image.swift
//  IdigueApi
//
//  Created by jessica bai on 9/14/23.
//

import Foundation

struct Image: Codable {

  var id    : String? = ""
var name  : String? = ""
  enum CodingKeys: String, CodingKey {

    case id    = "id"
    case name  = "name"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id    = try values.decodeIfPresent(String.self , forKey: .id    )
    name  = try values.decodeIfPresent(String.self , forKey: .name  )
 
  }

  init() {

  }

}
