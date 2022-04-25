//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var starAnimation: UIImageView!
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - This is used for accessing the properties of IQKeyboardManager
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        //This func is called because all the edit and logic functions are called under this
        callingEveryFunction()
    }
    
    //MARK: - CALLING ALL THE FUNCTIONS
    func callingEveryFunction() {
        //This will edit the text fields
        editTextFields(enterTextFieldName: enterEmail, CornerRadius: 10)
        editTextFields(enterTextFieldName: enterPassword, CornerRadius: 10)
        editButtons(button: signInButton, cornerRadius: 15)
        
        //This will add the images to left in text fields
        addLeftImageTo(txtField: enterEmail, imageName: "account")
        addLeftImageTo(txtField: enterPassword, imageName: "password")
        gifImage()
    }
    
    //MARK: - This will load the and display the gif in UIImageView
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
    
    //MARK: - This functions is used to Show Alert 
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionOfOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertActionOfCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(alertActionOfOk)
        alertController.addAction(alertActionOfCancel)
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - IBAction for Navigation to Menu Page
    @IBAction func navigateSignInToMenu(_ sender: UIButton) {
        if enterEmail.text == "" && enterPassword.text == "" {
            showAlert(title: "Re-Enter", message: "Please Enter E-mail and Password")
        } else if enterEmail.text == "" {
            showAlert(title: "Re-Enter", message: "Please Enter the E-Mail")
        } else if enterPassword.text == "" {
            showAlert(title: "Re-Enter", message: "Please Enter the Password")
        }
        else {
            if let email = enterEmail.text, let password = enterPassword.text {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        print(e.localizedDescription)
                    } else {
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let homeTabBarViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarViewController") as! HomeTabBarViewController
                        self.navigationController?.pushViewController(homeTabBarViewController, animated: true)
                    }
                }
            }
        }
    }
    
}
