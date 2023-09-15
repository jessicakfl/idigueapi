//
//  IdigueHttp.swift
//  IdigueApi
//
//  Created by jessica bai on 9/14/23.
//

import Foundation
import UIKit

class IdigueHttp: NSObject {
 
    func getCustomerRequest(custId: String, completion: @escaping (_ success: Idigue) -> Void) {
        
        let fullUrl = IdigieApi.CUSTOMER_REQUEST// + "?page=\(custId)"
        print(fullUrl)
        var request = URLRequest(url: URL(string: fullUrl)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 120 // 120 sec
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let myData = data, error == nil else { return }
            do {
                print(myData)
                let responseModel = try JSONDecoder().decode(Idigue.self, from: myData )
                DispatchQueue.main.async {
                    completion(responseModel)
                }
            } catch let err {
                print(err)
            }
        }.resume()
         
    }
    }
