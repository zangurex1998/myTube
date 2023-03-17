//
//  PlaylistTableViewCell.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit
import youtube_ios_player_helper
class PlaylistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videoPlayer.layer.masksToBounds = true
        videoPlayer.layer.cornerRadius = 12
    }
    
    func configure(with playlist: Playlist){
        videoPlayer.load(withVideoId: playlist.link ?? "")
    }

    
    
}
