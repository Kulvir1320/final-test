//
//  GpaCalculateViewController.swift
//  final test
//
//  Created by MacStudent on 2019-11-16.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation
class GpaCalculateViewController: UIViewController {
     var delegateOfsemster: semseterTableViewController?
   
    @IBOutlet var courseLabel: [UILabel]!
    
    @IBOutlet var coursetextField: [UITextField]!
    @IBOutlet weak var GPALabel: UILabel!

    
    
      var gpa = 0.0
      var audioplayer: AVAudioPlayer!
      var g: Double?
      var marks: Double?
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in courseLabel.indices{
    courseLabel[i].text = CoursesStructure.courseList[(delegateOfsemster?.semsterIndx)!][i]
            coursetextField[i].text = String(StudentStructure.studentsData[(delegateOfsemster?.StudentSemIndex)!].marks[(delegateOfsemster?.semsterIndx)!][i])
           
    
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    
    @IBAction func CalculateButton(_ sender: UIButton) {
        
          for item in coursetextField.indices{
            marks = gpaConverter(marks: Int(coursetextField[item].text!)!)
        StudentStructure.studentsData[delegateOfsemster!.StudentSemIndex].marks[delegateOfsemster!.semsterIndx][item] = Int(coursetextField[item].text!)!
                    let credit = courseLabel[item].text!
                    gpa += (marks! * Double(String(credit[credit.index(before: credit.endIndex)]))!)
                }
                let gpaOfsem = gpa / 20.0
                StudentStructure.studentsData[delegateOfsemster!.StudentSemIndex].gpa[delegateOfsemster!.semsterIndx] = gpaOfsem
                
                GPALabel.text = String(format: "GPA: %.2f / 4 ", gpaOfsem)
                
                
                
                if gpaOfsem > 2.8 {
                    let soundURL = Bundle.main.url(forResource: "Win", withExtension: "wav")
                    audioplayer = try! AVAudioPlayer(contentsOf: soundURL!)
                    audioplayer.play()
                }
                
            }
            
            func gpaConverter(marks: Int) -> Double {
                switch marks {
                case 0...49:
                    g = 0.0
                case 50...59:
                    g = 1.0
                case 60...62:
                    g = 1.7
                case 63...66:
                    g = 2.0
                case 67...69:
                    g = 2.3
                case 70...72:
                    g = 2.7
                case 73...76:
                    g = 3.0
                case 77...79:
                    g = 3.2
                case 80...86:
                    g = 3.5
                case 87...93:
                    g = 3.7
                case 94...100:
                    g = 4.0
                    
                default:
                    break
                }
                return g!
            }
    }
    

