//
//  Networking.swift
//  
//
//  Created by Александр Осипов on 21.07.2020.
//

import Foundation
import Alamofire

class Networking{
    
    func download(name: String, completion: @escaping ([[String: Any]]?) -> Void) {
        guard let url = URL(string: "https://api.github.com/users/\(name)/repos") else { return }
        AF.request(url).responseJSON{ response in
            switch response.result{
            case .success(let data):
                if let records = data as? [[String: Any]] {
                    completion(records)
                } else if let records = data as? [String: Any] {
                    completion([records])
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
