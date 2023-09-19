//
//  ImageDataPostModel.swift
//  IdigueApi
//
//  Created by jessica bai on 9/19/23.
//

import Foundation

struct ImageDataPostModel: Codable {
    var result : String? = nil

enum CodingKeys: String, CodingKey {

  case result = "result"

}

init(from decoder: Decoder) throws {
  let values = try decoder.container(keyedBy: CodingKeys.self)

  result = try values.decodeIfPresent(String.self , forKey: .result )

}

init() {

}

}
