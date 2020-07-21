//
//  Main.swift
//  
//
//  Created by Александр Осипов on 21.07.2020.
//

import Alamofire
import Foundation

class Main{
    
    let network = Networking()
    
    func start() {
        requestRepositories()
        let runLoop = RunLoop.main
        while runLoop.run(mode: .default, before: .distantFuture) { }
    }
    
    private func requestRepositories() {
        print("Введите имя")
        var name: String? = nil
        repeat {
            name = readLine()
        } while name!.isEmpty
        network.download(name: name!, completion: { response in
            guard let responce = response else { return }
            
            var repositories = [String]()
            for repository in responce {
                if let name = repository["name"] as? String {
                    repositories.append(name)
                } else if let name = repository["message"] as? String {
                    print(name)
                    self.requestRepositories()
                    return
                }
            }
            print(repositories)
            self.requestRepositories()
        })
    }
}
let main = Main()
main.start()
