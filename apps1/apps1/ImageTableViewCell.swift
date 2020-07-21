//
//  ImageTableViewCell.swift
//  apps1
//
//  Created by Александр Осипов on 20.07.2020.
//  Copyright © 2020 Александр Осипов. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let networking = Networking()
    
    var url: URL! {
        didSet {
            downloadImage(withURL: url)
        }
    }
    
    func downloadImage(withURL url: URL) {
        networking.downloadImage(withURL: url) { data in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.imageImageView.image = image
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
        imageImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
