//
//  StartViewController.swift
//  IdigueApi
//
//  Created by jessica bai on 9/18/23.
//

import UIKit
enum items {
    case image
    case blog
    case know
}
class StartViewController: UIViewController {
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "image") {

            if let viewController: ViewController = segue.destination as? ViewController {
                            viewController.itemstoshow = items.image
                        }

                    }
    }
    

}
