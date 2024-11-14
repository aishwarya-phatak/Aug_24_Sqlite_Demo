//
//  DBHelper.swift
//  Aug_24_Sqlite_Demo
//
//  Created by Vishal Jagtap on 14/11/24.
//

import Foundation
import SQLite3

class DBHelper{
    
    var dbPath = "mydatabase.sqlite"
    var db : OpaquePointer?
    
    init(){
        db = createDatabase()
        //createTable()
    }
    
    func createDatabase()->OpaquePointer?{
        let fileUrl = try! FileManager.default.url(for: .documentDirectory,
                                                   in: .userDomainMask,
                                                   appropriateFor: nil,
                                                   create: false).appendingPathComponent(dbPath)
        if sqlite3_open(fileUrl.path, &db) == SQLITE_OK{
            print("Database successfully created!")
        } else {
            print("Database creation unsuccessfull!")
        }
        
        return db
    }
    
    func createTable(){
        
        
        
        
    }
    
    func insertDataIntoTable(){
        
        
        
    }
    
    func deleteDataFromTable(){
        
        
        
    }
    
    func retriveDataFromTable(){
        
        
    }
}
