//
//  HomePageViewController.swift
//  project Food Passion
//
//  Created by Evelyn on 05/05/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet var collectionViewRecipe: UICollectionView!
    //let imageArray: [String] = ["image-1","image-2","image-3"]
    let imageArray = [UIImage(named: "food-1"), UIImage(named: "food-2"), UIImage(named: "food-3")]
    let titleArray: [String] = ["Chicken, Rice, and Vegetables","Boiled Egg","Brocolli Soup"]
    let calArray: [String] = ["40 kcal/serving","50 kcal/serving","60 kcal/serving"]
    var myIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        currentDate.textColor = .gray
        getCurrentDate()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    

    @IBOutlet weak var tableView: UITableView!
    func getCurrentDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd MMMM"
        let str = formatter.string(from: Date())
        currentDate.text = str
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

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionForToday", for: indexPath)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addFood", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "receiptsForYou", for: indexPath)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 620.0
        } else if indexPath.section == 1 {
            return 137.0
        } else {
            return 350.0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Suggestion for Today"
//        } else {
//            return "Recipes For You"
//        }
//    }
    
    
}

extension HomePageViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.imageRecipe.image = imageArray[indexPath.row]
        cell.calRecipe.text = calArray[indexPath.row]
        cell.titleRecipe.text = titleArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = mainStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//       // detailVC.imageView.image = imageArray[indexPath.row]
//        self.navigationController?.pushViewController(detailVC, animated: true)
        if indexPath.row == 0 {
            performSegue(withIdentifier: "detailView", sender: self)
        } else {
            let alert = UIAlertController(title: "Recipe", message: "This recipe is still on progress", preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
}
