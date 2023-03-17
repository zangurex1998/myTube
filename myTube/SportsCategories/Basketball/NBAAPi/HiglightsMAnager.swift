//
//  HiglightsMAnager.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

protocol NBAhighlightsProtocol{
    func fetchingHighlights(completion: @escaping (NBAHiglightsResponse) -> ())
}

class NBAHighlight: NBAhighlightsProtocol{
    func fetchingHighlights(completion: @escaping (NBAHiglightsResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/34e8945d-0de3-40c5-98e3-d9761ff92e95") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else { return }
            do{
                let decoded = try JSONDecoder().decode(NBAHiglightsResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            }
            catch{
                print(error)
            }
        }.resume()
    }
    
    
}
