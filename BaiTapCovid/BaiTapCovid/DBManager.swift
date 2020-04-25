//
//  DBManager.swift
//  BaiTapCovid
//
//  Created by Luong Quang Huy on 4/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager{
    private let database: Realm?
    
    static let shareInstant = DBManager()
    
    init(){
        database = try! Realm()
        print(database!.configuration.fileURL!)
    }
    
    func addNewDataToDatabase(content: String){
        let data = Data()
        data.id = UUID().uuidString
        data.content = content
        try! database?.write{
            database?.add(data)
        }
    }
    
    func deleteDataById(id: String){
        let predicate = NSPredicate(format: "id = %@", id)
        try! database?.write{
            let data = database?.objects(Data.self).filter(predicate)
            guard let result = data?.first else {return}
            database?.delete(result)
        }
    }
    
    func deleteObject(object: Data){
        try! database?.write{
            database?.delete(object)
        }
    }
    
    func updateObject(object: Data ,newContent: String){
        try! database?.write{
            object.content = newContent
        }
    }
    
    func updateDataById(id: String, newContent: String){
        let predicate = NSPredicate(format: "id = %@", id)
        try! database?.write{
            let data = database?.objects(Data.self).filter(predicate)
            guard let object = data?.first else {return}
            object.content = newContent
            database?.add(object, update: .modified)
        }
    }
    
    func getContentById(id: String) -> String?{
        let predicate = NSPredicate(format: "id = %@", id)
        let results = database?.objects(Data.self).filter(predicate)
        return results?.first?.content
    }
    
    func getAllData() ->Results<Data>?{
            let results = database?.objects(Data.self)
            return results
    }
}
