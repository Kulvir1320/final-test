//
//  StudentTableViewController.swift
//  final test
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController , UISearchResultsUpdating {
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    
let searchController = UISearchController(searchResultsController: nil)
    var filterStudents = [StudentStructure]()
    var studentIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        let search = UISearchController(searchResultsController: nil)
//       search.searchResultsUpdater = self
//        search.obscuresBackgroundDuringPresentation = false
//        search.searchBar.placeholder = "Type something here to search"
//        navigationItem.searchController = search
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterStudents.count
        }
        return StudentStructure.studentsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "studentName", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentName", for: indexPath)
        let stu: StudentStructure
        if searchController.isActive && searchController.searchBar.text != "" {
            stu = filterStudents[indexPath.row]
        }else {
            stu = StudentStructure.studentsData[indexPath.row]
        }
        
        
        cell.textLabel?.text = "\(stu.firstName) " + " " + "\(stu.lastName)"
        cell.detailTextLabel?.text = String(format: "%.2f", (stu.cgpa))
        
        // Configure the cell...

        return cell
    }
       
    func updateSearchResults(for searchController: UISearchController) {
        filternamesofstudents(for: searchController.searchBar.text ?? "")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
       
  func filternamesofstudents(for searchText: String) {
//        filternames = all
    filterStudents = StudentStructure.studentsData.filter({ (StudentStructure) -> Bool in
        StudentStructure.firstName.lowercased().contains(searchText.lowercased())
    })
    tableView.reloadData()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let details = segue.destination as? ViewController {
            details.delgateofStudent = self
        }
        if let sem = segue.destination as? semseterTableViewController{
            sem.delgateOfStudent = self
            if let cell = sender as? UITableViewCell{
        studentIndex = tableView.indexPath(for: cell)!.row
            }
        }
        tableView.reloadData()
       
    }
    

}
