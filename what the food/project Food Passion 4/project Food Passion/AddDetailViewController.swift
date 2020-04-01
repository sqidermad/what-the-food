//
//  AddDetailViewController.swift
//  Search
//
//  Created by Sherly Natalia on 09/05/19.
//  Copyright © 2019 Sherly Natalia. All rights reserved.
//

import UIKit

class AddDetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var calorieBar: UIProgressView!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Food", style: .plain, target: self, action: #selector(presentAction))
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        calorieBar.transform = calorieBar.transform.scaledBy(x: 2, y: 3)
    }
    
    @objc func presentAction() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let breakfastAction = UIAlertAction(title: "Breakfast", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to \n Breakfast", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    self.performSegue(withIdentifier: "goToInput", sender: self)
                }))
            self.present(alert, animated: true,completion: nil)
        }
        let lunchAction = UIAlertAction(title: "Lunch", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Lunch", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "goToInput", sender: self)
            }))
            self.present(alert, animated: true,completion: nil)
        }
        let dinnerAction = UIAlertAction(title: "Dinner", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Dinner", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.performSegue(withIdentifier: "goToInput", sender: self)
            }))
            self.present(alert, animated: true,completion: nil)
        }
        
        let cancel  = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(breakfastAction)
        actionSheet.addAction(lunchAction)
        actionSheet.addAction(dinnerAction)
        actionSheet.addAction(cancel)
        
        present(actionSheet,animated: true,completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed")
            textField.resignFirstResponder()
            return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
