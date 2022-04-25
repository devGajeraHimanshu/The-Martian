//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class PlanetPageViewController: UIViewController {

    // MARK: - IBOUTLETS
    @IBOutlet weak var earthImage: UIImageView!
    
    //MARK: - Declaring a Variable
    var quotesLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        quotesLabel = flipTheText()
        swipeGesture()
        view.addSubview(quotesLabel)
    }
    
    //MARK: - Swipe Gesture
    //In this function we will setup the Swipe Gesture
    func swipeGesture() {
        let gestureSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        gestureSwipe.direction = .left
        earthImage.isUserInteractionEnabled = true
        earthImage.addGestureRecognizer(gestureSwipe)
    }
    //In this function we will nevigate the swipe to next page
    @objc func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            navigateFunction(controllerName: "SecondPlanetViewController")
        }
    }
    
    //MARK: - This function will print a static label
    func flipTheText() -> UILabel {
        let quotesLabel:UILabel = UILabel(frame: CGRect(x: -45, y: 260, width: 210, height: 32))
        //quotesLabel.alignmentRect(forFrame: CGRect(x: 20, y: 235, width: 177, height: 32))
        quotesLabel.text = "The Martian"
        quotesLabel.font = UIFont(name: "Chalkduster", size: 29)
        quotesLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        return quotesLabel
    }
    
    //MARK: - This will navigate to next page
    @IBAction func navigateToTheNextPhoto(_ sender: UIButton) {
        navigateFunction(controllerName: "SecondPlanetViewController")
    }
    
    //MARK: - This function will navigate the controller to the next page
    func navigateFunction(controllerName: String) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navigateToSolarSystemPage = storyBoard.instantiateViewController(withIdentifier: controllerName)
        navigationController?.pushViewController(navigateToSolarSystemPage, animated: true)
    }
    
}
