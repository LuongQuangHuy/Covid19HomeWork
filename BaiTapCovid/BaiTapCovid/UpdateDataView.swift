//
//  UpdateDataView.swift
//  BaiTapCovid
//
//  Created by Luong Quang Huy on 4/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import UIKit

class UpdateDataView: UIViewController {
    private var passid: String?
    var getId: String? {
        set{
            self.passid = newValue
        }
        get{
            return self.passid
        }
    }
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var updateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.layer.cornerRadius = 10.0
        self.updateButton.layer.cornerRadius = 10.0
        self.updateButton.layer.borderWidth = 2.0
        self.updateButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        guard let id = passid else {return}
        self.textView.text = DBManager.shareInstant.getContentById(id: id)
    }
    @IBAction func updateDataSubmit(_ sender: Any) {
        if textView.text != ""{
                   DBManager.shareInstant.updateDataById(id: getId ?? "No id", newContent: textView.text)
                       for vc in navigationController!.viewControllers{
                           if let mainView = vc as? MainView {
                               mainView.tableView.reloadData()
                               self.navigationController?.popToViewController(mainView, animated: true)
                           }
                       }
               }
    }
}

