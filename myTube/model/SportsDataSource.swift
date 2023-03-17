//
//  SportsDataSource.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import Foundation
import UIKit
class SportDataSource{
    static let sportShared = SportDataSource()
    var sports: [Sport] = [
        .init(image:UIImage(named: "Football")! , sportName: "Football"),
        .init(image: UIImage(named: "NBA")!, sportName: "Basketball"),
        .init(image: UIImage(named: "UFC ")!, sportName: "UFC")
    ]
}
