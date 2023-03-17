//
//  AllStarProtocol.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import Foundation

protocol AllStarProtocol{
    func fetchAllStar(completion : @escaping (AllStarResponse) -> ())
}
class AllStarAPiManager: AllStarProtocol {
    func fetchAllStar(completion: @escaping (AllStarResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/e36068d4-e044-4f60-b413-27f1c4b62ff6") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else { return }
            do{
                let decoded = try JSONDecoder().decode(AllStarResponse.self, from: data)
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
