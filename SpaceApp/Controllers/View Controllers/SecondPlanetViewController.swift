//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class SecondPlanetViewController: UIViewController {

    @IBOutlet weak var skyViewImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeGesture()
    }
    
    //MARK: - Implimenting Swipe Gesture
    //In this function we will setup the Swipe Gesture which will swipe to Next and Previous Page
    func swipeGesture() {
        //Next Page
        let gestureSwipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        gestureSwipeLeft.direction = .left
        skyViewImage.isUserInteractionEnabled = true
        skyViewImage.addGestureRecognizer(gestureSwipeLeft)
        
        //Previous Page
        let gestureSwipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        gestureSwipeRight.direction = .right
        skyViewImage.addGestureRecognizer(gestureSwipeRight)
    }
    
    //In this function we will nevigate the swipe to next page
    @objc func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            navigationController?.popViewController(animated: true)
        } else if sender.direction == .left {
            navigateFunction(controllerName: "LogInSignUpViewController")
        }
    }
    
    //MARK: - IBActions
    @IBAction func goToLoginSignUpPage(_ sender: UIButton) {
        navigateFunction(controllerName: "LogInSignUpViewController")
    }
    
    //MARK: - This function will navigate the controller to the next page
    func navigateFunction(controllerName: String) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navigateToSolarSystemPage = storyBoard.instantiateViewController(withIdentifier: controllerName)
        navigationController?.pushViewController(navigateToSolarSystemPage, animated: true)
    }
}
