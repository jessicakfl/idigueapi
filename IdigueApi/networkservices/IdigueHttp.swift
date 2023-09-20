//
//  IdigueHttp.swift
//  IdigueApi
//
//  Created by jessica bai on 9/14/23.
//

import Foundation
import UIKit

class IdigueHttp: NSObject {
    var itemstoshow = items.image
    func getImageRequest(completion: @escaping (_ success: Idigue) -> Void) {
        
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
    func getBlogRequest(completion: @escaping (_ success: Idigue) -> Void) {
        
        let fullUrl = IdigieApi.BLOGS_REQUEST// + "?page=\(custId)"
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
    func getKnowRequest(completion: @escaping (_ success: Idigue) -> Void) {
        
        let fullUrl = IdigieApi.KNOWS_REQUEST// + "?page=\(custId)"
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
    
    func postImageData(body: ImagePost,
                         completion: @escaping (_ success: ImagePost) -> Void) {
           
           let fullUrl = IdigieApi.IMAGE_POST
           print(fullUrl)
           var request = URLRequest(url: URL(string: fullUrl)!)
           request.httpMethod = "POST"
           request.timeoutInterval = 120 // 120 sec
           
           
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let jsonData = try JSONEncoder().encode(body)
        request.httpBody = jsonData
        }
           catch {
               fatalError("unable to convert data to JSON")
           }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {return}

            do{
                let ip = try JSONDecoder().decode(ImagePost.self, from: data)
                print("Response data:\n \(ip)")
            }catch let jsonErr{
                print(jsonErr)
           }

     
    }
    task.resume()
       }
    }
