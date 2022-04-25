//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class ARMenuController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var showUniverse: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTabBarViewController().tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - This
    @IBAction func showUniverse(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toUniverseSegue", sender: self)
        print("Universe Button Pressed")
    }
    
    @IBAction func showAR(_ sender: UIButton!) {
        self.performSegue(withIdentifier: "showARSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showARSegue" {
            let vc = segue.destination as! PlanetController
            vc.choosenPlanet = (sender as! UIButton).titleLabel!.text!
        }
    }
}


