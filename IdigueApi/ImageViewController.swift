//
//  ImageViewController.swift
//  IdigueApi
//
//  Created by jessica bai on 10/6/23.
//

import UIKit



class ImageViewController: UIViewController {
    @IBOutlet weak var idigueimageview: IdigueImageView!
    var imagename=""
    var base64EncodedImageString=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .white
        if let imageData =  Data(base64Encoded: base64EncodedImageString, options: .ignoreUnknownCharacters),     
            let uiimage = UIImage(data: imageData) {
            print(uiimage.size)
                //let catImage = UIImage(named: "IMG_1249.jpeg")
        
        let myImageView:UIImageView = UIImageView()
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        myImageView.frame.size.width = 300
        myImageView.frame.size.height = 500
        myImageView.center = self.view.center
        
        myImageView.image = uiimage
        
        view.addSubview(myImageView)
        
        self.view = view
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation


}
