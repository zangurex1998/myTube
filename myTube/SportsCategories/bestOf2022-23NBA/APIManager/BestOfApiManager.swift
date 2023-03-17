//
//  BestOfApiManager.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

protocol bestOfAPIManagerProtocol{
    func fetch(completion: @escaping (BestOfResponse) -> ())
}
class bestOfAPiManager: bestOfAPIManagerProtocol{
    func fetch(completion: @escaping (BestOfResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/861df880-5efc-47f9-94a0-3cb5dbb770a0") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {return}
            do{
                let decoded = try JSONDecoder().decode(BestOfResponse.self, from: data)
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
