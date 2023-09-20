//
//  ViewController.swift
//  IdigueApi
//
//  Created by jessica bai on 9/13/23.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let idiguehttp = IdigueHttp()
    
    private var images : [Image]? = []
    private var blogs : [Blog]? = []
    private var knows : [Knowledgebase]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainer()
        loadData()
        title = "\(idiguehttp.itemstoshow)"
    }
    @IBAction func adNew(_ sender: Any) {
        
        let alertController = UIAlertController(title: "New Photo", message: "Add to Idigue", preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = "Photo Name..."
         }
        alertController.addTextField { (textField) in
            textField.placeholder = "if public..."
          }
        alertController.addTextField { (textField) in
            textField.placeholder = "Write your code..."
          }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            guard let textName = alertController.textFields?.first?.text else {return}
            guard let textispublic = alertController.textFields?[1].text else {return}
            guard let textcode = alertController.textFields?[2].text else {return}
            
            print("\(textName)--\(textispublic)--\(textcode)")
            
            let imagepost = ImagePost(name: textName, code: textcode, completed: true)
            self.idiguehttp.postImageData(body: imagepost) { success in
                print("Success: \(imagepost)")
                self.loadData()
                
            }
           
      }))
        self.present(alertController, animated: true)    }
    
    
    func setupContainer(){
           self.tableView.delegate = self
           self.tableView.dataSource = self
        //self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
           self.tableView.reloadData()
           self.tableView.separatorColor = UIColor.blue
       }
       
       func loadData() {
           switch idiguehttp.itemstoshow {
           case .image:
           idiguehttp.getImageRequest() {
               success in
               print(success)
             
               if let md = success.images {
                   self.images = md
               }
             self.tableView.reloadData()
           
           }
           case .blog:
               idiguehttp.getBlogRequest() {
                   success in
                   print(success)
                 
                   if let md = success.blogs {
                       self.blogs = md
                   }
                 self.tableView.reloadData()
               
               }
           case .know:
               idiguehttp.getKnowRequest() {
                   success in
                   print(success)
                 
                   if let md = success.knows {
                       self.knows = md
                   }
                 self.tableView.reloadData()
               
               }
           }
    
}}
extension  ViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return images?.count ?? 0
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            switch idiguehttp.itemstoshow {
            case .image:
                if let md = images?[indexPath.row] {
                    cell.lblid?.text = "Id: \(md.id ?? "")"
                    cell.lblname?.text  = "\(md.name ?? "")"
                   
               }
            case .blog:
                if let md = blogs?[indexPath.row] {
                    cell.lblid?.text = "Id: \(md.id ?? "")"
                    cell.lblname?.text  = "\(md.contents ?? "")"
                   
               }
            case .know:
                if let md = knows?[indexPath.row] {
                    cell.lblid?.text = "Id: \(md.id ?? "")"
                    cell.lblname?.text  = "\(md.contents ?? "")"
                   
               }            }
       
          return cell
        }

        @objc func updateData(_ sender: UIButton) {
            if let md = images?[sender.tag] {
                // todo show alert to update data
                let alertController = UIAlertController(title: "Update", message: "Update Your Information", preferredStyle: .alert)
    //            alertController.addTextField { textfield in
    //                textfield.placeholder = "ID..."
    //            }
                    alertController.addTextField { (textField) in
                        textField.placeholder = "Your Name..."
                        textField.text = "\(md.name ?? "")"
                      }
               
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                   guard let textId = alertController.textFields?.first?.text else {return}
                    guard let textName = alertController.textFields?[0].text else {return}
                    //guard let textPhone = alertController.textFields?[1].text else {return}
                    //guard let textNote = alertController.textFields?[2].text else {return}
                 //print("\(textName)--\(textPhone)--\(textNote)")
                   
                    let mBody: [String : Any] = [
                        "id"    : "\(md.id ?? "")",
                        "name"  : "\(textName)"
                        //"phone" : "\(textPhone)",
                        //"note"  : "\(textNote)"
                    ]
                  //self.idiguehttp.putUserData(body: mBody) { (userPutModel) in
                        //print("Success: \(userPutModel.result )")
                        //self.loadMyData()
                  //}
             }))
                self.present(alertController, animated: true)
                // when click on ok call update api
                // call get api to refresh data
           }
        }

        @objc func deleteData(_ sender: UIButton) {
            if let md = images?[sender.tag] {
                // todo show alert before delete
                
                let alertController = UIAlertController(title: "Alert!", message: "Do you want to delete \"\(md.name ?? "")\"?", preferredStyle: .alert)
    //            alertController.addTextField { textfield in
    //                textfield.placeholder = "ID..."
    //   }
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
               // guard let textId = alertController.textFields?.first?.text else {return}
              // print("\(textId)")
                let mBody: [String : Any] = [
                        "id"    : "\(md.id ?? "")",
                    ]
                    //self.idiguehttp.DeleteUserData(body: mBody) { (userDeleteModel) in
                     //   print("Success: \(userDeleteModel.result)")
                       // self.loadMyData()
                    //}
            }))
                self.present(alertController, animated: true)
                // when click on ok call update api
                // call get api to refresh data
                
            }
        }        }
