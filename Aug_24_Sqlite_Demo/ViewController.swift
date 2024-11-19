//
//  ViewController.swift
//  Aug_24_Sqlite_Demo
//
//  Created by Vishal Jagtap on 14/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DBHelper.shared.insertDataIntoTable(rNumber: 10, name: "Aniket")
//        DBHelper.shared.insertDataIntoTable(rNumber: 11, name: "Pallavi")
//        DBHelper.shared.insertDataIntoTable(rNumber: 12, name: "Suhaan")
        
//        DBHelper.shared.retriveDataFromTable()
        
//        DBHelper.shared.deleteDataFromTable(rn: 11)
//        DBHelper.shared.deleteDataFromTable(rn: 12)
//        DBHelper.shared.deleteDataFromTable(rn: 10)
//        DBHelper.shared.deleteDataFromTable(name: "Aniket")

        
//        DBHelper.shared.insertDataIntoTable(rNumber: 13, name: "Rohit")
//        DBHelper.shared.insertDataIntoTable(rNumber: 14, name: "Snehal")
//        DBHelper.shared.insertDataIntoTable(rNumber: 15, name: "Meghaa")
        
        var students : [Student] = DBHelper.shared.retriveDataFromTable()
        
        for eachStudent in students{
            print("\(eachStudent.name) -- \(eachStudent.rollNumber)")
        }
    }
}
