//
//  NBADatasource.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

class NBADataSource{
    static let shared = NBADataSource()
    var data: [NBACategories] = [
        .init(name: "Higlights"),
        .init(name: "ALL Star"),
        .init(name: "Best Of Christmas"),
        .init(name: "Best Of 2022-23"),
        .init(name: "Fantastic Finishes")
    ]
}
