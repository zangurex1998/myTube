//
//  File.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

protocol ChristmasAPimanagerProtocol{
    func fetchChristmas(completion: @escaping (ChristmasResponse) -> ())
}
class ChristmasAPIManager: ChristmasAPimanagerProtocol{
    func fetchChristmas(completion: @escaping (ChristmasResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/acc19044-7625-4bcf-bf4f-759921281cb1") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {return}
            
            do{
                let decoded = try JSONDecoder().decode(ChristmasResponse.self, from: data)
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
