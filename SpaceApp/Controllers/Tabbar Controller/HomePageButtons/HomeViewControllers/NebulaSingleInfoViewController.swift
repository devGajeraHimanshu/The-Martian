//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//
import UIKit

class NebulaSingleInfoViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var selectedName: UILabel!
    @IBOutlet weak var nebulaImages: UIImageView!
    @IBOutlet weak var segmentLabel: UILabel!
    @IBOutlet weak var nebulaInfoSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentLabel.text = "Now Nebula"
    }
    
    //MARK: - IBActions
    @IBAction func backToTheNebulaPage(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func controlSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentLabel.text = "Now Nebula"
        case 1:
            segmentLabel.text = "Information Nebula"
        default:
            print("The Label is not Selected")
        }
    }
}
