//
//  NBADatasource.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation
import UIKit
class NBADataSource{
    static let shared = NBADataSource()
    var data: [NBACategories] = [
        .init(name: "Higlights", image: UIImage(named: "NBA")!),
        .init(name: "ALL Star", image: UIImage(named: "NBA")!),
        .init(name: "Best Of Christmas", image: UIImage(named: "NBA")!),
        .init(name: "Best Of 2022-23", image: UIImage(named: "NBA")!),
        .init(name: "Fantastic Finishes", image: UIImage(named: "NBA")!),
        .init(name: "Bloopers", image: UIImage(named: "NBA")!),
        .init(name: "Mic'd Up | 2022-23", image: UIImage(named: "NBA")!),
        .init(name: "Top Performances | 2022-23", image: UIImage(named: "NBA")!),
        .init(name: "Higlights", image: UIImage(named: "euroleague")!),
        .init(name: "Awards Candidate | 2022-23", image: UIImage(named: "euroleague")!),
        .init(name: "Magic Moments", image: UIImage(named: "euroleague")!),
        .init(name: "MVP | 2022-23", image: UIImage(named: "euroleague")!),
        .init(name: "Top 10 Plays | 2022-23", image: UIImage(named: "euroleague")!)
    ]
}
