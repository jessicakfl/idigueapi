//
//  Knowledgebase.swift
//  IdigueApi
//
//  Created by jessica bai on 9/18/23.
//

import Foundation

struct Knowledgebase: Codable {

  var id    : Int? = 0
    var title  : String? = ""
    var contents  : String? = ""
    var keywords  : String? = ""
    var links  : String? = ""
    
  enum CodingKeys: String, CodingKey {

    case id    = "id"
    case title  = "title"
    case contents  = "contents"
      case keywords  = "keywords"
      case links  = "links"
      
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id    = try values.decodeIfPresent(Int.self , forKey: .id    )
    title  = try values.decodeIfPresent(String.self , forKey: .title  )
    contents  = try values.decodeIfPresent(String.self , forKey: .contents  )
      keywords  = try values.decodeIfPresent(String.self , forKey: .keywords  )
      links  = try values.decodeIfPresent(String.self , forKey: .links  )
  }

  init() {

  }

}
