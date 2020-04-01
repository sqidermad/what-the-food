//
//  ViewController.swift
//  Should
//
//  Created by Sherly Natalia on 06/05/19.
//  Copyright © 2019 Sherly Natalia. All rights reserved.
//

import UIKit

class shouldViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
extension shouldViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 547.0
        } else if indexPath.section == 1 {
            return 281
        } else if indexPath.section == 2 {
            return 136
        } else {
            return 115
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageIdentifier", for: indexPath)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shouldIdentifier", for: indexPath)
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shouldn'tIdentifier", for: indexPath)
            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "notesIdentifier", for: indexPath)
            return cell
        }
        
    }
    
    

    
}

