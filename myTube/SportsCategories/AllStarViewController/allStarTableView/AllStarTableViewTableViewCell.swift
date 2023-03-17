//
//  AllStarTableViewTableViewCell.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit
import Kingfisher
class AllStarTableViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var allStarImage: UIImageView!
    
    @IBOutlet weak var allStarName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with allStar : FetchAllstar){
        allStarName.text = allStar.videoName
        allStarImage.kf.indicatorType = .activity
        allStarImage.kf.setImage(with: URL(string: allStar.channelThumb))
    }

   
    
}
