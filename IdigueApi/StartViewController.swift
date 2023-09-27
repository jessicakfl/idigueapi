//
//  StartViewController.swift
//  IdigueApi
//
//  Created by jessica bai on 9/18/23.
//

import UIKit

enum items { case image, blog, know }

class StartViewController: UIViewController {
    @IBOutlet weak var txturl: UITextField!
    @IBAction func btnimage(_ sender: UIButton) {
        IdigueHttp.itemstoshow = "image"
        
    }
    
    @IBAction func btnseturl(_ sender: UIButton) {
        IdigieApi.BASE_URL=txturl!.text ?? "http://idigue.com/api/"
        
    }
  
    
    
    
    @IBAction func btnblog(_ sender: UIButton) {
        IdigueHttp.itemstoshow="blog"
        
    }
    
    @IBAction func btnknow(_ sender: UIButton) {
        IdigueHttp.itemstoshow="know"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: self)
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "image") {

            if let viewController: ViewController = segue.destination as? ViewController {
                //viewController.itemstoshow = "image"
                        }
                }
        else if (segue.identifier == "blog") {

            if let viewController: ViewController = segue.destination as? ViewController {
                //viewController.itemstoshow = "blog"
            }
         }
        else if (segue.identifier == "know") {

        if let viewController: ViewController = segue.destination as? ViewController {
            //viewController.itemstoshow = "know"
                        }
                }
        }
    

}
