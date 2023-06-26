//
//  ListTableViewCell.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 22/06/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
