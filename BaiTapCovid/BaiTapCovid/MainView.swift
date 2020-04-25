//
//  MainView.swift
//  BaiTapCovid
//
//  Created by Luong Quang Huy on 4/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    var myData = DBManager.shareInstant.getAllData()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTableView()
    }
    
    func configureTableView(){
        self.tableView.rowHeight = 80
        self.tableView.bounces = false
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    func configureNavigationBar(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNew(_:)))
    }
    
    @objc func addNew(_ sender: UINavigationBar){
        let createView = storyboard?.instantiateViewController(identifier: "CreateDataView") as? CreateDataView
        guard let cv = createView else {return}
        self.navigationController?.pushViewController(cv, animated: true)
    }

}

extension MainView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataCount = myData?.count else {return 0}
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
            cell.contentLabel.text = myData![indexPath.row].content ?? "No content"
            cell.id = myData![indexPath.row].id ?? "No id"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            guard let tableViewCellData = myData else {return}
            DBManager.shareInstant.deleteObject(object: tableViewCellData[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableViewCellData = myData else {return}
        let updateView = storyboard?.instantiateViewController(identifier: "UpdateDataView") as? UpdateDataView
        guard let uv = updateView else {return}
        uv.getId = tableViewCellData[indexPath.row].id
        self.navigationController?.pushViewController(uv, animated: true)
        
    }
    
}


