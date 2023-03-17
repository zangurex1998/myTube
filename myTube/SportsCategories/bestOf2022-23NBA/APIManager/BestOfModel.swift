//
//  BestOfModel.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

struct BestOfResponse: Codable{
    let bestOfNBA: [BestOf]
}

struct BestOf: Codable{
    let videolink: String
    let channelThumb: String
    let videoName: String
}
