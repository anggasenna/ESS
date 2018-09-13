//
//  DBConnection.swift
//  MobileAttendance
//
//  Created by MacOs on 8/29/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import Foundation
import SQLite3

class DBConnection {
    
    static var db: OpaquePointer?
    
    static func openDatabase () {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Coba.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        } else {
            print("Connected")
        }
    }
    
    
}


