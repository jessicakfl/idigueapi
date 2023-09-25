//
//  IdigueApi.swift
//  IdigueApi
//
//  Created by jessica bai on 9/14/23.
//

import Foundation

class IdigieApi {
    
    public static var BASE_URL = "http://idigue.com/api/"
    
    static let V1 = ""
    
    static let CUSTOMER_REQUEST = BASE_URL + V1 + "api.php"
    static let BLOGS_REQUEST = BASE_URL + V1 + "apiblogs.php"
    static let KNOWS_REQUEST = BASE_URL + V1 + "apiknowledgebases.php"
    static let IMAGE_POST = BASE_URL + V1 + "apiimagenew.php"
    static let BLOG_POST = BASE_URL + V1 + "apiimagenew.php"
    static let KNOW_POST = BASE_URL + V1 + "apiimagenew.php"
    
    
}
