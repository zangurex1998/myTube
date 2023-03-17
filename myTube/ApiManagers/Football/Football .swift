//
//  Football .swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import Foundation

struct footballResponse: Codable{
    var football: [football]
}


struct football: Codable {
    var videoName: String
    var channelTumb: String
    var videoLink: String
}
