//
//  CreateDataView.swift
//  BaiTapCovid
//
//  Created by Luong Quang Huy on 4/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import UIKit

class CreateDataView: UIViewController {
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
            self.textView.layer.cornerRadius = 10.0
            self.addButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func addNewButton(_ sender: Any) {
        if textView.text != ""{
            DBManager.shareInstant.addNewDataToDatabase(content: textView.text)
            for vc in navigationController!.viewControllers{
                if let mainView = vc as? MainView {
                    mainView.tableView.reloadData()
                    self.navigationController?.popToViewController(mainView, animated: true)
                }
            }
        }
    }
}
