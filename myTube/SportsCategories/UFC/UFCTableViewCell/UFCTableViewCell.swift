//
//  UFCTableViewCell.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit
import Kingfisher
class UFCTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ufcImage: UIImageView!
    @IBOutlet weak var ufcHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ufcImage.layer.cornerRadius = ufcImage.frame.width / 2
    }
    
    
    func configure(with ufc: Ufc){
        ufcImage.kf.indicatorType = .activity
        ufcImage.kf.setImage(with: URL(string: ufc.channelThumb))
        ufcHeader.text = ufc.videoName
    }
    
 
    
}
