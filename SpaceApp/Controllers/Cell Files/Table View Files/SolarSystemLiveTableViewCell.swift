//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class SolarSystemLiveTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var planetImages: UIImageView!
    @IBOutlet weak var planetNames: UILabel!
    @IBOutlet weak var lightYearsData: UILabel!
    @IBOutlet weak var starAnimation: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gifImage()
    }
    
    //MARK: - Gif Load in Image View
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
