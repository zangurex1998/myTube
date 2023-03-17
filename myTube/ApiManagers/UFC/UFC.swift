//
//  UFC.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

struct UfcResponse: Codable{
    let ufcGeorgia: [Ufc]
}

struct Ufc: Codable{
    let videolink: String
    let channelThumb: String
    let videoName: String
}
