//
//  PopUp.swift
//  Lagilagi
//
//  Created by Jessica Clarisa Hindratno on 08/05/19.
//  Copyright © 2019 Jessica Clarisa Hindratno. All rights reserved.
//

import UIKit

class PopUpInScan: UIViewController {

    
    @IBOutlet weak var bigRect: UIView!
    
    @IBOutlet weak var smallRect: UIView!
    
    
    @IBAction func addFoodButton(_ sender: Any) {
        presentAction()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.applyRoundBigCorner(bigRect)
        self.applyRoundCorner(smallRect)
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        // Do any additional setup after loading the view.
    }
    
    func presentAction() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let breakfastAction = UIAlertAction(title: "Breakfast", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Breakfast", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "goToScan", sender: self)
            }))
            self.present(alert, animated: true,completion: nil)
        }
        let lunchAction = UIAlertAction(title: "Lunch", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Lunch", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "goToScan", sender: self)
            }))
            self.present(alert, animated: true,completion: nil)
        }
        let dinnerAction = UIAlertAction(title: "Dinner", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Dinner", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "goToScan", sender: self)
            }))
            self.present(alert, animated: true,completion: nil)
        }
        
        let cancel  = UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            self.performSegue(withIdentifier: "goToScan", sender: self)
        })
        
        actionSheet.addAction(breakfastAction)
        actionSheet.addAction(lunchAction)
        actionSheet.addAction(dinnerAction)
        actionSheet.addAction(cancel)
        
        present(actionSheet,animated: true,completion: nil)
        
//        self.performSegue(withIdentifier: "goToScan", sender: self)
//
//        self.view.removeFromSuperview()
    }
    
    //untuk bentuk button
    func applyRoundCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 20
        object.layer.masksToBounds = true
    }
    func applyRoundBigCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 30
        object.layer.masksToBounds = true
    }

    
    @IBAction func cancelButton(_ sender: Any) {
        //sekalian balik ke menu scan
        self.performSegue(withIdentifier: "goToScan", sender: self)
        
        self.view.removeFromSuperview()
    }
    

}
