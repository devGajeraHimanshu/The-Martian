//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//
import UIKit

class HomePageViewController: UIViewController {
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var constellationButton: UIButton!
    @IBOutlet weak var solarSystemButton: UIButton!
    @IBOutlet weak var nebulaButton: UIButton!
    @IBOutlet weak var satelliteButton: UIButton!
    @IBOutlet weak var astronomicalNewsImage: UIImageView!
    @IBOutlet weak var starAnimation: UIImageView!
    @IBOutlet weak var astronomicalSection: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        callingEveryFunction()
        gifImage()
    }
    
    //MARK: - Gif Load in Image View
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }
    
    //MARK: - CALLING ALL THE FUNCTIONS
    func callingEveryFunction() {
        
        //MARK: -  This if for Editing the View
        editButtons(button: constellationButton, cornerRadius: 10)
        editButtons(button: solarSystemButton, cornerRadius: 10)
        editButtons(button: nebulaButton, cornerRadius: 10)
        editButtons(button: satelliteButton, cornerRadius: 10)
        astronomicalSection.layer.cornerRadius = 10
        astronomicalSection.layer.masksToBounds = true
        astronomicalNewsImage.layer.cornerRadius = 10
        astronomicalNewsImage.layer.masksToBounds = true
    }
    
    //MARK: - This function is used to edit the buttons.
    func editButtons(button: UIButton, cornerRadius: CGFloat) {
        button.layer.cornerRadius = cornerRadius
        button.layer.masksToBounds = true
    }
    
    //MARK: - IBACTIONS
    //This Button Action will root to Constellation page
    @IBAction func rootToConstellationPage(_ sender: UIButton) {
    }
    
    //This Button Action will root to Solar System page
    @IBAction func rootToSolarSystemPage(_ sender: UIButton) {
//        navigateFunction(controllerName: "SolarSystemViewController")
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ARViewViewController") as! ARViewViewController
        navigationController?.present(controller, animated: true, completion: nil)
    }
    
    //This Button Action will root to nebula page
    @IBAction func rootToNebulaPage(_ sender: UIButton) {
        navigateFunction(controllerName: "NebulaViewController")
    }
    
    //This Button Action will root to Satellite page
    @IBAction func rootToSatellitePage(_ sender: UIButton) {
    }
    
    //This Button Action will root to Constellation News page
    @IBAction func rootToConstellationNews(_ sender: UIButton) {
    }
    
    func navigateFunction(controllerName: String) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navigateToSolarSystemPage = storyBoard.instantiateViewController(withIdentifier: controllerName)
        navigationController?.pushViewController(navigateToSolarSystemPage, animated: true)
    }
    
}
