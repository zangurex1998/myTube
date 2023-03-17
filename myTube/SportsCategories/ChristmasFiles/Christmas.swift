//
//  Christmas.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

struct ChristmasResponse: Codable{
    let NBAChristmas: [Christmas]
}

struct Christmas: Codable{
    let videolink: String
    let channelThumb: String
    let videoName: String
}
