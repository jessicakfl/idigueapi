//
//  IdigueHttp.swift
//  IdigueApi
//
//  Created by jessica bai on 9/14/23.
//

import Foundation
import UIKit

class IdigueHttp: NSObject {
    
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
                print(myData.description)
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
        let postString = "name=\(body.name!)&ispublic=\(body.ispublic!)&code=\(body.code!)";
        print(postString)
        // Set HTTP Request Body
            request.httpBody = postString.data(using: String.Encoding.utf8);
       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                      print("Response data string:\n \(dataString)")
                  }
     
    }
    task.resume()
       }
    
    func postBlogData(body: BlogPost,
                         completion: @escaping (_ success: BlogPost) -> Void) {
           
           let fullUrl = IdigieApi.BLOG_POST
           print(fullUrl)
           var request = URLRequest(url: URL(string: fullUrl)!)
           request.httpMethod = "POST"
        let postString = "title=\(body.title!)&contents=\(body.contents!)";
        print(postString)
        // Set HTTP Request Body
            request.httpBody = postString.data(using: String.Encoding.utf8);
       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                      print("Response data string:\n \(dataString)")
                  }
     
    }
    task.resume()
       }
    
    func postKnowData(body: KnowPost,
                         completion: @escaping (_ success: KnowPost) -> Void) {
           
           let fullUrl = IdigieApi.KNOW_POST
           print(fullUrl)
           var request = URLRequest(url: URL(string: fullUrl)!)
           request.httpMethod = "POST"
        let postString = "title=\(body.title!)&contents=\(body.contents!)";
        print(postString)
        // Set HTTP Request Body
            request.httpBody = postString.data(using: String.Encoding.utf8);
       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                      print("Response data string:\n \(dataString)")
                  }
     
    }
    task.resume()
       }}
