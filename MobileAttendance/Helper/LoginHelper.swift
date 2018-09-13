//
//  LoginHelper.swift
//  MobileAttendance
//
//  Created by MacOs on 9/4/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import Foundation
import SQLite3

class LoginHelper {
    
    static var loginList = [Login]()
    static var db: OpaquePointer?
    
    static func loginCheck(username: String, password: String) -> Bool {
        
        loginList.removeAll()
        
        let query = "SELECT * FROM Login WHERE username='\(username)' AND password='\(password)'"
        
        var stmt: OpaquePointer?
        
        if sqlite3_prepare(db, query, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error: \(errmsg)")
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = sqlite3_column_int(stmt, 0)
            let username = String(cString: sqlite3_column_text(stmt, 1))
            let password = String(cString: sqlite3_column_text(stmt, 2))
            
            loginList.append(Login(id: Int(id), username: username, password: password))
        }
        
        if loginList.isEmpty {
            return false
        } else {
            return true
        }
     
    }
    
    static func loggingOut (){
        
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        
    }
}
