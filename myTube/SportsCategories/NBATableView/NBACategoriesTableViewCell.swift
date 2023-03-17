//
//  NBACategoriesTableViewCell.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit

class NBACategoriesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var categoriesLbl: UILabel!

    
    @IBOutlet weak var categoryImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    
    func configure(with nbaCat: NBACategories){
        categoriesLbl.text = nbaCat.name
        categoryImage.image = nbaCat.image
    }
 
    
}
