//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class LogInSignUpViewController: UIViewController {

    // MARK: - IBOUTLETS.
    @IBOutlet weak var starAnimation: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Functions Calling.
        callingEveryFunction()
    }
    
    //MARK: - CALLING ALL THE FUNCTIONS
    func callingEveryFunction() {
        editButtons(button: signUpButton, cornerRadius: 15)
        editButtons(button: logInButton, cornerRadius: 15)
        gifImage()
    }
    
    //MARK: - This will load the and display the gif in UIImageView
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }
    
    //MARK: - This function is used to edit the buttons.
    func editButtons(button: UIButton, cornerRadius: CGFloat) {
        button.layer.cornerRadius = cornerRadius
        button.layer.masksToBounds = true
    }
    
    //MARK: - IBActions for Navigation of Sign and Sign up page.
    @IBAction func navigateToSignUpPage(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        starAnimation.stopAnimating()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    @IBAction func navigateToSignInPage(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        starAnimation.stopAnimating()
        navigationController?.pushViewController(signInViewController, animated: true)
    }
}

