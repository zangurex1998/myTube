//
//  BasketballCategoriesTableViewCell.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit
import Kingfisher
class BasketballCategoriesTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var channelImage: UIImageView!
    
    @IBOutlet weak var VideoName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with highlights: NBAHiglights){
        VideoName.text = highlights.videoName
        channelImage.kf.indicatorType = .activity
        channelImage.kf.setImage(with: URL(string: highlights.channelThumb))
    }

    
}
