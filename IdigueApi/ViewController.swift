//
//  ViewController.swift
//  IdigueApi
//
//  Created by jessica bai on 9/13/23.
//

import UIKit
class ViewController: UIViewController {
    var itemstoshow = "image"
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    let idiguehttp = IdigueHttp()
    
    private var images : [Image]? = []
    private var blogs : [Blog]? = []
    private var knows : [Knowledgebase]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupContainer()
        //loadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupContainer()
        loadData()
        title = "\(itemstoshow)"
    }
    
    @IBAction func adNew(_ sender: Any) {
        switch itemstoshow {
        case "image":
            let alertController = UIAlertController(title: "New Image", message: "Add to Idigue", preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = "Name..."
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
            
            let imagepost = ImagePost(name: textName, ispublic: textispublic, code: textcode, completed: true)
            self.idiguehttp.postImageData(body: imagepost) { success in
                print("Success: \(imagepost)")
                self.loadData()
                
            }
           
      }))
        self.present(alertController, animated: true)
        case "blog":
            let alertController = UIAlertController(title: "New blog", message: "Add to Idigue", preferredStyle: .alert)
       
        alertController.addTextField { (textField) in
            textField.placeholder = "title..."
          }
        alertController.addTextField { (textField) in
            textField.placeholder = "Write contents..."
          }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            guard let texttitle = alertController.textFields?[1].text else {return}
            guard let textcontents = alertController.textFields?[2].text else {return}
            
            print("(texttitle)--\(textcontents)")
            
            let blogpost = BlogPost(title: texttitle, contents: textcontents, completed: true)
            self.idiguehttp.postBlogData(body: blogpost) { success in
                print("Success: \(blogpost)")
                self.loadData()
                
            }
           
      }))
        self.present(alertController, animated: true)
       
            case "know":
                let alertController = UIAlertController(title: "New knowledgebase", message: "Add to Idigue", preferredStyle: .alert)
           
            alertController.addTextField { (textField) in
                textField.placeholder = "title..."
              }
            alertController.addTextField { (textField) in
                textField.placeholder = "Write contents..."
              }
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                guard let texttitle = alertController.textFields?[1].text else {return}
                guard let textcontents = alertController.textFields?[2].text else {return}
                
                print("(texttitle)--\(textcontents)")
                
                let knowpost = KnowPost(title: texttitle, contents: textcontents, completed: true)
                self.idiguehttp.postKnowData(body: knowpost) { success in
                    print("Success: \(knowpost)")
                    self.loadData()
                    
                }
               
          }))
        self.present(alertController, animated: true)
        default:
            let alertController = UIAlertController(title: "New "+itemstoshow, message: "Add to Idigue", preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = "Name..."
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
            
            let imagepost = ImagePost(name: textName, ispublic: textispublic, code: textcode, completed: true)
            self.idiguehttp.postImageData(body: imagepost) { success in
                print("Success: \(imagepost)")
                self.loadData()
                
            }
           
      }))
        self.present(alertController, animated: true)
        }
        
    }
    
    
    func setupContainer(){
           self.tableView.delegate = self
           self.tableView.dataSource = self
           self.tableView.reloadData()
           self.tableView.separatorColor = UIColor.blue
       }
       
       func loadData() {
           switch itemstoshow {
           case "image":
           idiguehttp.getImageRequest() {
               success in
               print(success)
             
               if let md = success.images {
                   self.images = md
               }
               self.tableView.reloadData()
               
           }
           case "blog":
               idiguehttp.getBlogRequest() {
                   success in
                   print(success)
                 
                   if let md = success.blogs {
                       self.blogs = md
                   }
                   self.tableView.reloadData()
                   
               }
           case "know":
               idiguehttp.getKnowRequest() {
                   success in
                   print(success)
                 
                   if let md = success.knows {
                       self.knows = md
                   }
                   self.tableView.reloadData()               }
           default:
               idiguehttp.getImageRequest() {
                   success in
                   print(success)
                 
                   if let md = success.images {
                       self.images = md
                   }
                   self.tableView.reloadData()
                   
               }
               
           }
           
       }       }
           
extension  ViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch itemstoshow {
            case "image":
                return images?.count ?? 0
            case "blog":
                return blogs?.count ?? 0
            case "know":
                return knows?.count ?? 0
            default:
                return images?.count ?? 0
                
            }
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            switch itemstoshow {
            case "image":
                if let md = images?[indexPath.row] {
                    cell.lblid?.text = "Id: \(md.id ?? "")"
                    cell.lblname?.text  = "\(md.name ?? "")"
                   
               }
            case "blog":
                if let md = blogs?[indexPath.row] {
                    cell.lblid?.text = "Id: \(md.id ?? "")"
                    cell.lblname?.text  = "\(md.title ?? "")"
                   
               }
            case "know":
                if let md = knows?[indexPath.row] {
                    cell.lblid?.text = "Id: \(md.id ?? "")"
                    cell.lblname?.text  = "\(md.title ?? "")"
                   
               }
            default:
                if let md = images?[indexPath.row] {
                    cell.lblid?.text = "Id: \(md.id ?? "")"
                    cell.lblname?.text  = "\(md.name ?? "")"
                }
                
            }
      
                  return cell
        }

        @objc func updateData(_ sender: UIButton) {
            if let md = images?[sender.tag] {
                // todo show alert to update data
                let alertController = UIAlertController(title: "Update", message: "Update Your Information", preferredStyle: .alert)
    //            }
                    alertController.addTextField { (textField) in
                        textField.placeholder = "Your Name..."
                        textField.text = "\(md.name ?? "")"
                      }
               
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                   guard let textId = alertController.textFields?.first?.text else {return}
                    guard let textName = alertController.textFields?[0].text else {return}
                   
                    let mBody: [String : Any] = [
                        "id"    : "\(md.id ?? "")",
                        "name"  : "\(textName)"
                    ]
             }))
                self.present(alertController, animated: true)
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
            }
        }
    
}
