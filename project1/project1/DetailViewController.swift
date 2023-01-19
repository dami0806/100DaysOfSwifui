//
//  DetailViewController.swift
//  project1
//
//  Created by 박다미 on 2023/01/19.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
       

        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
        
        
        // Do any additional setup after loading the view.
    }
   

  

}
