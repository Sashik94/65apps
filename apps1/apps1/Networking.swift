//
//  Networking.swift
//  apps1
//
//  Created by Александр Осипов on 20.07.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import Foundation

class Networking {
    
    func downloadImage(withURL url: URL, complition: @escaping (Data?) -> Void) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.sync {
                complition(data)
            }
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
