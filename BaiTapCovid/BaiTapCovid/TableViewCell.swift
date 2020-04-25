//
//  TableViewCell.swift
//  BaiTapCovid
//
//  Created by Luong Quang Huy on 4/25/20.
//  Copyright © 2020 Luong Quang Huy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var id: String?
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
