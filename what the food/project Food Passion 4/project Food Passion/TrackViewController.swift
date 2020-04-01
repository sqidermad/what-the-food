//
//  TableViewController.swift
//  tryToCombineProgressBarWithCell
//
//  Created by Christoper Glorian on 09/05/19.
//  Copyright © 2019 Christoper Glorian. All rights reserved.
//

import UIKit

class TrackViewController: UITableViewController {

    @IBAction func inputButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToDetailInput", sender: self)
    }
    var image: UIImage?
    @IBOutlet weak var scanButton: UIButton!

    let pickerController = UIImagePickerController()
    
    let cellId = "cellId"
    
    var twoDimension = [ExpandableFood(isExpanded : false, name :["Strawberry Oatmeal Smoothie"],kcal: [236], portion: ["1 glass(500 gram)"]), ExpandableFood(isExpanded: false, name: ["Chicken Rice and Vegetable Soup"],kcal: [140], portion: ["1 bowl"]), ExpandableFood(isExpanded: false, name: ["Pineapple (slices)"],kcal: [48], portion: ["2 slice(s)"])]
    
    
    // for progress view
    @IBOutlet weak var myCaloriesLabel: UILabel!
    @IBOutlet weak var myCarbsRecommended: UILabel!
    @IBOutlet weak var myProteinRecommended: UILabel!
    @IBOutlet weak var myFatRecommended: UILabel!
    @IBOutlet weak var myFibreRecommended: UILabel!
    
    @IBOutlet weak var myCarbsLabel: UILabel!
    @IBOutlet weak var myProteinLabel: UILabel!
    @IBOutlet weak var myFatLabel: UILabel!
    @IBOutlet weak var myFibreLabel: UILabel!
    
    @IBOutlet weak var caloriesProgress: UIProgressView!
    @IBOutlet weak var carbsProgress: UIProgressView!
    @IBOutlet weak var proteinProgress: UIProgressView!
    @IBOutlet weak var fatProgress: UIView!
    @IBOutlet weak var fibreProgress: UIProgressView!
    // =================
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        navigationItem.title = "Add & Track"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        // CALORIES
        let weight: Double = 41.0
        
        let caloriesFormula: Int = (Int)((14.7 * weight + 496.0) * 1.30)
        let caloriesConsume: Int = twoDimension[0].kcal[0] + twoDimension[1].kcal[0] + twoDimension[2].kcal[0]
        
        myCaloriesLabel.text = "(\(caloriesConsume)/\(caloriesFormula))"
        
        // Carbs
        
        let carbsFormula: Double = (Double(caloriesFormula)/4.0)
        let carbsMin: Int = (Int(carbsFormula * 0.5))
        let carbsMax: Int = (Int(carbsFormula * 0.7))
        myCarbsRecommended.text = "Recommended: \(carbsMin) gr - \(carbsMax) gr"
        myCarbsLabel.text = "(50/100)"
        
        // Protein
        
        let proteinMin: Int = (Int(carbsFormula * 0.1))
        let proteinMax: Int = (Int(carbsFormula * 0.15))
        
        myProteinRecommended.text = "Recommended: \(proteinMin) gr - \(proteinMax) gr"

        myProteinLabel.text = "(50/100)"
        
        // Fat
        let fatFormula = (Double(caloriesFormula)/9.0)
        let fatMin: Int = (Int(fatFormula * 0.2))
        let fatMax: Int = (Int(fatFormula * 0.35))
        
        myFatRecommended.text = "Recommended: \(fatMin) gr - \(fatMax) gr"
        myFatLabel.text = "(50/100)"
        
        // Fibre
        let fibreFormula = ((Int)((Double)(caloriesFormula)/1000.0) * 14)
        myFibreRecommended.text = "Recommended: \(fibreFormula) gr"
        myFibreLabel.text = "(50/100)"
        
        pickerController.sourceType = UIImagePickerController.SourceType.camera
        pickerController.delegate = self
        
        //function rounded rectangle di-apply
//        self.applyRoundCorner(scanButton)
        
    }
    
    
    //untuk bentuk button
    func applyRoundCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 4
        object.layer.masksToBounds = true
    }
    
    //hbs pencet scan bakal ke camera
    @IBAction func scan(_ sender: Any) {
        present(pickerController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destinationVC = segue.destination as? ViewingImage {
            destinationVC.image = self.image
        }
    }

    // MARK: - Table view data source

    @objc func back() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if !twoDimension[section].isExpanded {
            return 0
        }
        
        return twoDimension[section].name.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let name = twoDimension[indexPath.section].name[indexPath.row]
        
        let kcal = twoDimension[indexPath.section].kcal[indexPath.row]
        
        let portion = twoDimension[indexPath.section].portion[indexPath.row]
        
        cell.textLabel?.text = "\(name) \n \(portion)"
        cell.textLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.text = "\(kcal) kcal"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let button = UIButton(type: .system)
            if section == 0 {
                button.setTitle("Breakfast  ►", for: .normal)
            }else if section == 1 {
                button.setTitle("Lunch  ►", for: .normal)
            }else {
                button.setTitle("Dinner ►", for: .normal)
            }
            button.backgroundColor = #colorLiteral(red: 0.2953886092, green: 0.8058731556, blue: 0.8564139009, alpha: 1)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

            
            button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
            
            button.tag = section
            return button
    }
        
     @objc func handleShowIndexPath() {
            var indexPathToReload = [IndexPath] ()
            
            for section in twoDimension.indices {
                for row in twoDimension[section].name.indices {
                    let indexPath = IndexPath(row: row, section: section)
                    indexPathToReload.append(indexPath)
                }
            }
        }
        
    @objc func handleOpenClose(button: UIButton) {
            let section = button.tag
            var indexPaths = [IndexPath]()
            
            for row in twoDimension[section].name.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            
            let isExpanded = twoDimension[section].isExpanded
            twoDimension[section].isExpanded = !isExpanded
            
            
            if section == 0 && isExpanded {
                button.setTitle("Breakfast  ►", for: .normal)
            }else if section == 0 && !isExpanded{
                button.setTitle("Breakfast  ▼", for: .normal)
            }else if section == 1 && isExpanded {
                button.setTitle("Lunch  ►", for: .normal)
            }else if section == 1 && !isExpanded{
                button.setTitle("Lunch  ▼", for: .normal)
            }else if section == 2 && isExpanded {
                button.setTitle("Dinner ►", for: .normal)
            }else if section == 2 && !isExpanded{
                button.setTitle("Dinner ▼", for: .normal)
            }
            
            if isExpanded {
                tableView.deleteRows(at: indexPaths, with: .fade)
            }else {
                tableView.insertRows(at: indexPaths, with: .fade)
            }
        }
        
        override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 45
        }
        
        
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension TrackViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let capturedImage =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        self.image = capturedImage
        picker.dismiss(animated: true) {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "goToDetail", sender: self)
            }
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
