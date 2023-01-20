//
//  DetailViewController.swift
//  Project1
//
//  Created by 박다미 on 2023/01/20.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       title = selectedImage
       navigationItem.largeTitleDisplayMode = .never //VC에서 title을 크게 설정해서 여기도 크게 됨 ->여긴 작게 하고싶을때 사용
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
