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
        DBHelper.shared.insertDataIntoTable(rNumber: 11, name: "Pallavi")
        DBHelper.shared.insertDataIntoTable(rNumber: 12, name: "Suhaan")
        
        DBHelper.shared.deleteDataFromTable(rn: 11)
    }
}
