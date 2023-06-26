//
//  FilmsCollectionViewCell.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 20/06/23.
//

import UIKit

class FilmsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var chapterImage: UIImageView!
    @IBOutlet weak var lblChapter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        chapterImage.layer.cornerRadius = 10
    }

}
