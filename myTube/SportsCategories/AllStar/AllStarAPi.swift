//
//  AllStarAPi.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

struct AllStarResponse: Codable{
    let NBAallStar: [FetchAllstar]
    
}

struct FetchAllstar:Codable{
    let videolink: String
    let channelThumb: String
    let videoName: String
}
