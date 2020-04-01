//
//  ViewingImage.swift
//  Lagilagi
//
//  Created by Jessica Clarisa Hindratno on 08/05/19.
//  Copyright © 2019 Jessica Clarisa Hindratno. All rights reserved.
//

import UIKit

class ViewingImage: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpID") as! PopUpInScan
        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
