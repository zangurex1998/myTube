//
//  Highlights.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

struct NBAHiglightsResponse: Codable{
    let NBAhiglights: [NBAHiglights]
}

struct NBAHiglights:Codable{
    let videolink: String
    let channelThumb: String
    let videoName: String
    
}
