//
//  LikedTableViewCell.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit
import youtube_ios_player_helper
import CoreData
class LikedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videoPlayer.layer.masksToBounds = true
        videoPlayer.layer.cornerRadius = 10
    }
    
    func configure(with liked: Liked){
        videoPlayer.load(withVideoId: liked.link ?? "")
    }

    
   

}
