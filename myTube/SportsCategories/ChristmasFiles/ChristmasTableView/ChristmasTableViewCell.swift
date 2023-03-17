//
//  ChristmasTableViewCell.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit
import Kingfisher
class ChristmasTableViewCell: UITableViewCell {
    
    @IBOutlet weak var christmasImage: UIImageView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func configure(with christmas : Christmas){
        headerLabel.text = christmas.videoName
        christmasImage.kf.indicatorType = .activity
        christmasImage.kf.setImage(with: URL(string: christmas.channelThumb))
    }
    
    
}
