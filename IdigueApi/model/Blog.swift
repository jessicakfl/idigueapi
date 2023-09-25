//
//  Blog.swift
//  IdigueApi
//
//  Created by jessica bai on 9/18/23.
//

import Foundation

struct Blog: Codable {

    var id    : String? = ""
    var title  : String? = ""
    var contents  : String? = ""

    enum CodingKeys: String, CodingKey {

      case id    = "id"
      case title  = "title"
      case contents  = "contents"    }

    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)

      id    = try values.decodeIfPresent(String.self , forKey: .id    )
      title  = try values.decodeIfPresent(String.self , forKey: .title  )
      contents  = try values.decodeIfPresent(String.self , forKey: .contents  )    }

    init() {

    }

}
