//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class AboutController: UIViewController {
    
    
    @IBOutlet weak var logoApp: UIImageView!
    
    @IBOutlet weak var namaApp: UILabel!
    
    @IBOutlet weak var creatorApp: UILabel!
    
    @IBOutlet weak var versionApp: UILabel!
    
    @IBOutlet weak var toPlaneDetect: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HomeTabBarViewController().tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func toPlaneDetectionAction(_ sender: Any) {
        performSegue(withIdentifier: "toPlaneDetectionSegue", sender: self)
        print("Plane Detection Button Pressed")
    }
}

