//
//  Tableviewcell.swift
//  IdigueApi
//
//  Created by jessica bai on 9/14/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblid: UILabel!
    @IBOutlet weak var lblname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
