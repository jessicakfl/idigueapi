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
    
    @IBAction func btnseturl(_ sender: Any) {
        IdigieApi.BASE_URL=txturl!.text ?? "http://idigue.com/api/"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "image") {

            if let viewController: ViewController = segue.destination as? ViewController {
               viewController.idiguehttp.itemstoshow = items.image
                        }
                }
        else if (segue.identifier == "blog") {

            if let viewController: ViewController = segue.destination as? ViewController {
                viewController.idiguehttp.itemstoshow = items.blog
               
            }

                    }
        else if (segue.identifier == "know") {

        if let viewController: ViewController = segue.destination as? ViewController {
            viewController.idiguehttp.itemstoshow = items.know
                        }

                    }
    }
    

}
