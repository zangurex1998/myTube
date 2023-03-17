//
//  UFCAPIManager.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

protocol UFCAPIManagerProtocol{
    func fetching(completion : @escaping (UfcResponse) -> ())
}
class UFCAPIManager: UFCAPIManagerProtocol{
    func fetching(completion: @escaping (UfcResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/05a79dd8-0a4b-4dfb-9495-2331b3b32e8b") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else {return}
            
            do{
                let decoded = try JSONDecoder().decode(UfcResponse.self, from: data)
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
