//
//  DataForm.swift
//  BaiTapCovid
//
//  Created by Luong Quang Huy on 4/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object{
    @objc dynamic var id: String?
    @objc dynamic var content: String?
    
    @objc class override func primaryKey() -> String? {
        return "id"
    }
}
