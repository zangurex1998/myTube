//
//  CategoriesDataSource.swift
//  myTube
//
//  Created by technomix on 15.03.23.
//

import Foundation
import UIKit
class DataSource{
    static var shared = DataSource()
    var categories : [AppCategories] = [
        .init(image: UIImage(named: "TVSeries")!, header: "TV-Series"),
        .init(image: UIImage(named: "Sports")!, header: "Sports"),
        .init(image: UIImage(named:"LaughingEmoji")!, header: "entartainment"),
        .init(image: UIImage(named: "Trailers")!, header: "Trailers"),
        .init(image: UIImage(named: "Learn")!, header: "Learning"),
        .init(image: UIImage(named: "child")!, header: "For Children")
        
    ]
}
