//
//  ViewController.swift
//  final test
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var studentId: UITextField!
    var delgateofStudent: StudentTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: UIButton) {
       
        let alertController = UIAlertController(title: "alert", message: "Are you Sure?", preferredStyle: .alert)
        let NoAction = UIAlertAction(title: "No Way!", style: .default, handler: nil)
        let yesAction = UIAlertAction(title: "Yes, I'm Sure!", style: .default) { (action) in
            let FirstName = self.firstname.text
            let LastName = self.lastname.text
            let StudentId = self.studentId.text
                                           
            let StuData = StudentStructure(firstName: FirstName!, lastName: LastName!, studentID: StudentId!)
                                           
            StudentStructure.studentsData.append(StuData)
                                    
          
            
            let alert = UIAlertController(title: "New Contact Saved", message: "\(FirstName!) is now student", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default) { (action) in
                
              self.firstname.text = ""
                self.lastname.text = ""
                self.studentId.text = ""
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        alertController.addAction(NoAction)
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        delgateofStudent?.tableView.reloadData()
    }
}

