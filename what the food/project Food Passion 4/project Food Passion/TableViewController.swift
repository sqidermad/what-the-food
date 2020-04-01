//
//  TableViewController.swift
//  Search
//
//  Created by Sherly Natalia on 08/05/19.
//  Copyright © 2019 Sherly Natalia. All rights reserved.
//

import UIKit

class Food {
    let labelTitle: String
    let labelCalorie: String
    let imageArray: String
    
    init(labelTitle: String, labelCalorie: String, imageArray: String ) {
        self.labelTitle = labelTitle
        self.labelCalorie = labelCalorie
        self.imageArray = imageArray
    }
}

class TableViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate {
    var isSearchBeenActived: Bool = false
    
    private func setUpFood() {
        foodArray.append(Food(labelTitle: "Boiled Egg", labelCalorie: "72 cals / serving", imageArray: "boiled_png"))
        foodArray.append(Food(labelTitle: "Broccoli Soup", labelCalorie: "187 cals / serving", imageArray: "broccoli_fix 2"))
        foodArray.append(Food(labelTitle: "Honey Lemon \nGinger Tea", labelCalorie: "104 cals / serving", imageArray: "tea_fix"))
        foodArray.append(Food(labelTitle: "Strawberry Oatmeal\nSmoothie", labelCalorie: "236 cals / serving", imageArray: "smoothie_fix"))
        searchFood = foodArray
    }
    
     var foodArray = [Food]()
    var searchFood = [Food]()
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        setUpFood()
        createSearchBar()
        navigationItem.backBarButtonItem?.tintColor = .white
      //  addFoodButton.isHidden = true
     navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func createSearchBar() {
        let searchController: UISearchController = {
            let search = UISearchController(searchResultsController: nil)
            search.definesPresentationContext = true
            search.dimsBackgroundDuringPresentation = false
            search.searchResultsUpdater = self
            search.delegate = self
            return search
        }()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController?.searchBar.placeholder = "Search food or brand"
    }
    
    func filterContent(for searchtext: String) {
//        guard !searchtext.isEmpty else {
//            searchFood = foodArray
//            tableView.reloadData()
//            return
//        }
//        searchFood = foodArray.filter({ food -> Bool in
//            food.labelTitle.lowercased().contains(searchtext.lowercased())
//            })
//        tableView.reloadData()
        searchFood = foodArray.filter({ food -> Bool in let match = food.labelTitle.range(of: searchtext, options: .caseInsensitive)
            return match != nil
        })
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        isSearchBeenActived = true
        searchFood = foodArray
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If the search bar contains text, filter our data with the string
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            print("\(searchText)")
            // Reload the table view with the search result data.
            isSearchBeenActived = true
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return isSearchBeenActived ? searchFood.count : 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = isSearchBeenActived ? searchFood[indexPath.row]  : foodArray[indexPath.row]
        
            let cell = (tableView.dequeueReusableCell(withIdentifier: "recentIdentifier", for: indexPath) as? TableViewCell)!
        
//        if searching {
//            cell.textTitle.text =
//        }
            cell.imagesView.image = UIImage(named: entry.imageArray)
            cell.textTitle.text = entry.labelTitle
            cell.textCalorie.text = entry.labelCalorie
            cell.moreImage.image = UIImage(named: "more_final")
            return  cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return isSearchBeenActived ?"":"Your recent food"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        searchController.dismiss(animated: false)
//        dismiss(animated: true)
//        print( )
        if searchFood[indexPath.row].labelTitle.contains("Strawberry") {
            performSegue(withIdentifier: "dishIdentifier", sender: self)
        }
    }

   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

