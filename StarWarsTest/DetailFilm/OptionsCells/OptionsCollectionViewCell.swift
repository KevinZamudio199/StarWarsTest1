//
//  OptionsCollectionViewCell.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 22/06/23.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblOption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        mainView.layer.borderColor = UIColor.white.cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 25
    }

}
