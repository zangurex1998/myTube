//
//  CategoriesTableViewCell.swift
//  myTube
//
//  Created by technomix on 15.03.23.
//

import UIKit
import Kingfisher
class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoriesImage: UIImageView!
    
    @IBOutlet weak var categoriesName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoriesImage.layer.cornerRadius = 10 
    }
    
    func configure(with category: AppCategories){
        categoriesImage.image = category.image
        categoriesName.text = category.header
    
    }

  
    
}
