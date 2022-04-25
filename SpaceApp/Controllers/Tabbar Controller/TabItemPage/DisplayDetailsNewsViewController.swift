//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class DisplayDetailsNewsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var headingData: UILabel!
    @IBOutlet weak var newsInformation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editImage()
    }
    
    //MARK: - This will load the and display the gif in UIImageView
    func editImage() {
        newsImage.layer.cornerRadius = 8
        newsImage.layer.masksToBounds = true
    }
    
    @IBAction func popBackToSpaceNewsController(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
