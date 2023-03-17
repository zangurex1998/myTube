//
//  SportTableViewCell.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sportImage: UIImageView!
    
    @IBOutlet weak var sportName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sportImage.layer.cornerRadius = 10
    
    }
    
    func configure(with sport: Sport){
        sportImage.image = sport.image
        sportName.text = sport.sportName
    }
    
    

  
}
