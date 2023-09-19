//
//  Image.swift
//  IdigueApi
//
//  Created by jessica bai on 9/14/23.
//

import Foundation

struct Idigue: Codable {

  var message : String?  = nil
  var images   : [Image]? = []
  var blogs   : [Blog]? = []
  var knows   : [Knowledgebase]? = []
    
  enum CodingKeys: String, CodingKey {

    case message = "message"
    case images   = "images"
      case blogs   = "blogs"
      case knows   = "knows"
      
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    message = try values.decodeIfPresent(String.self  , forKey: .message )
    images   = try values.decodeIfPresent([Image].self , forKey: .images   )
      blogs   = try values.decodeIfPresent([Blog].self , forKey: .blogs   )
      knows   = try values.decodeIfPresent([Knowledgebase].self , forKey: .knows   )
  }

  init() {

  }

}
