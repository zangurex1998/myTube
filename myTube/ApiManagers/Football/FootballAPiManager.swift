//
//  FootballAPiManager.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import Foundation

protocol FootballAPiManagerProtocol{
    func fetchFootball(completion: @escaping (footballResponse) -> Void)
}

class FootballApiManager: FootballAPiManagerProtocol{
    func fetchFootball(completion: @escaping (footballResponse) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/c7eccf12-bf39-402d-aaf0-34bbdb5f07e4") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            
            do{
                let decoded = try JSONDecoder().decode(footballResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}
