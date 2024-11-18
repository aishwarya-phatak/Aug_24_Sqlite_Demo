//
//  DBHelper.swift
//  Aug_24_Sqlite_Demo
//
//  Created by Vishal Jagtap on 14/11/24.
//

import Foundation
import SQLite3

//by the use of final kkeyword - inheritance is restricted
final class DBHelper{
    
    static let shared = DBHelper()
    var dbPath = "mydatabase.sqlite"
    var db : OpaquePointer?
    
    init(){
        db = createDatabase()
        createTable()
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
        let createQueryString = "CREATE TABLE IF NOT EXISTS Student(rollNumber INTEGER, name TEXT);"
        var createStatement : OpaquePointer?
        if sqlite3_prepare(db,
                           createQueryString,
                           -1,
                           &createStatement,
                           nil) == SQLITE_OK{
            print("Preparation is successful")
            
            if sqlite3_step(createStatement) == SQLITE_DONE{
                print("table created succesfully")
            } else {
                print("table creation unsuccessfully")
            }
        } else {
            print("Preparation is unsuccessful")
        }
        
        sqlite3_finalize(createStatement)
    }
    
    func insertDataIntoTable(rNumber : Int, name : String){
        let insertQueryString = "INSERT INTO Student(rollNumber, name) VALUES(?,?);"
        var insertStatement : OpaquePointer?
        if sqlite3_prepare(db,
                           insertQueryString,
                           -1,
                           &insertStatement,
                           nil) == SQLITE_OK{
            print("Statement preparation successful")
            
            sqlite3_bind_int(insertStatement, 1, Int32(rNumber))
            sqlite3_bind_text(insertStatement,
                              2,
                              (name as NSString).utf8String,
                              -1,
                              nil)
        
                if sqlite3_step(insertStatement) == SQLITE_DONE{
                    print("insert statement prepration succesful")
                } else {
                    print("insert statement prepration falied")
                }
            } else {
            print("Statement prepartion failed")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func deleteDataFromTable(rn : Int){
        let deleteQueryString = "DELETE FROM Student where rollNumber = ?;"
        var deleteStatement : OpaquePointer?
        if sqlite3_prepare(db,
                           deleteQueryString,
                           -1,
                           &deleteStatement,
                           nil) == SQLITE_OK{
             print("Delete Statement Preparation succesful")
            
            sqlite3_column_int(deleteStatement, 1)
//            sqlite3_column_text(deleteStatement, 2)
            
            if sqlite3_step(deleteStatement) == SQLITE_DONE{
                print("the record deleted")
            } else {
                print("the record not deleted")
            }
        } else {
            print("Delete Statement Preparation Unsuccessful")
        }
        
        sqlite3_finalize(deleteStatement)
    }
    
    func retriveDataFromTable(){
        
        
    }
}
