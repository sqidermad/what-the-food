//
//  ViewController.swift
//  Suggestion
//
//  Created by Sherly Natalia on 06/05/19.
//  Copyright © 2019 Sherly Natalia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addFoodAction(_ sender: UIButton) {
        presentAction()
    }
    
    func presentAction() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let breakfastAction = UIAlertAction(title: "Breakfast", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Breakfast", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true,completion: nil)
        }
        let lunchAction = UIAlertAction(title: "Lunch", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Lunch", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true,completion: nil)
        }
        let dinnerAction = UIAlertAction(title: "Dinner", style: .default) { (action) in
            let alert = UIAlertController(title: "Successful", message: "Your food already add to Dinner", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true,completion: nil)
        }
       
        let cancel  = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(breakfastAction)
        actionSheet.addAction(lunchAction)
        actionSheet.addAction(dinnerAction)
        actionSheet.addAction(cancel)
        
        present(actionSheet,animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return  .lightContent
    }

    @IBAction func homeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 260.0
        } else if indexPath.section == 1 {
            return 273
        } else if indexPath.section == 2 {
            return 336
        } else if indexPath.section == 3 {
            return 393
        } else {
            return 129
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "suggestImageIdentifier", for: indexPath)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "suggestTitleIdentifier", for: indexPath)
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsIdentifier", for: indexPath)
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stepsIdentifier", for: indexPath)
            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "noteIdentifier", for: indexPath)
            return cell
        }
        
    }
}
