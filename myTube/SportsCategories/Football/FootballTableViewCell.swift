//
//  FootballTableViewCell.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit
import Kingfisher
class FootballTableViewCell: UITableViewCell {
    
    @IBOutlet weak var channelImage: UIImageView!
    
    @IBOutlet weak var videoHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI(){
        channelImage.layer.cornerRadius = channelImage.frame.width / 2
    }
    
    func configure(with foot: football){
        channelImage.kf.indicatorType = .activity
        channelImage.kf.setImage(with: URL(string: foot.channelTumb))
        videoHeader.text = foot.videoName
    }
   
    
}
