//
//  BestOfTableViewCell.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit
import Kingfisher
class BestOfTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bestImage: UIImageView!
    
    @IBOutlet weak var bestLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(with best: BestOf){
        bestImage.kf.indicatorType = .activity
        bestImage.kf.setImage(with: URL(string: best.channelThumb))
        bestLbl.text = best.videoName
    }

    
}
