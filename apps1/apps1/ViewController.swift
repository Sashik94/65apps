//
//  ViewController.swift
//  apps1
//
//  Created by Александр Осипов on 20.07.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableImagesTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
        
        cell.activityIndicator.startAnimating()
        let url = URL(string: "http://placehold.it/375x150?text=\(indexPath.row + 1)")!
        cell.url = url
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width / 2.5
    }
}
