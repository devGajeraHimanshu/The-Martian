//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//
import UIKit
import IQKeyboardManagerSwift

class SignInViewController: UIViewController, UITextFieldDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var starAnimation: UIImageView!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        callingEveryFunction()
    }
    
    
    //MARK: - CALLING ALL THE FUNCTIONS
    func callingEveryFunction() {
        //MARK: - Calling The Video function to load that mp4 video into the UIView.

        //This will edit the text fields
        editTextFields(enterTextFieldName: enterEmail, CornerRadius: 10)
        editTextFields(enterTextFieldName: enterPassword, CornerRadius: 10)
        editButtons(button: signInButton, cornerRadius: 15)
        
        //This will add the images to left in text fields
        addLeftImageTo(txtField: enterEmail, imageName: "account")
        addLeftImageTo(txtField: enterPassword, imageName: "password")
        gifImage()
    }
    
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }
    
    //MARK: - This is function if for add icon to the left in the text field
    func addLeftImageTo(txtField: UITextField, imageName: String) {
        
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 27, height: 27))
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.addSubview(imageView)
        view.backgroundColor = .clear
        txtField.leftViewMode = UITextField.ViewMode.always
        txtField.leftView = view
    }
    
    //MARK: - This function is used to edit the textFields.
    func editTextFields(enterTextFieldName: UITextField, CornerRadius: CGFloat) {
        enterTextFieldName.layer.cornerRadius = CornerRadius
        enterTextFieldName.layer.masksToBounds = true
        enterTextFieldName.layer.cornerRadius = CornerRadius
        enterTextFieldName.layer.masksToBounds = true
    }
    
    //MARK: - This function is used to edit the buttons.
    func editButtons(button: UIButton, cornerRadius: CGFloat) {
        button.layer.cornerRadius = cornerRadius
        button.layer.masksToBounds = true
    }
    
    
    //MARK: - IBAction for Navigation to Menu Page
    @IBAction func navigateSignInToMenu(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        starAnimation.stopAnimating()
        let homeTabBarViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarViewController") as! HomeTabBarViewController
        navigationController?.pushViewController(homeTabBarViewController, animated: true)
    }
    
}
