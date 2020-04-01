//
//  ViewController.swift
//  project Food Passion
//
//  Created by Evelyn on 29/04/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.performSegue(withIdentifier: "nextPage", sender: nil)
         }
    }
    
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

