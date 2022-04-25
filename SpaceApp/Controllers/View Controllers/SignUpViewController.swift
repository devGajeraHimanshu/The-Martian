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

class SignUpViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var enterYourName: UITextField!
    @IBOutlet weak var enterYourEmail: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var reEnterPassword: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var starAnimation: UIImageView!
    
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
        //This will add the images to left in text fields
        addLeftImageTo(txtField: enterYourName, imageName: "account")
        addLeftImageTo(txtField: enterYourEmail, imageName: "email")
        addLeftImageTo(txtField: enterPassword, imageName: "password")
        addLeftImageTo(txtField: reEnterPassword, imageName: "reEnterPassword")
        
        //This will edit the text fields
        editTextFields(enterTextFieldName: enterYourName, CornerRadius: 10)
        editTextFields(enterTextFieldName: enterYourEmail, CornerRadius: 10)
        editTextFields(enterTextFieldName: enterPassword, CornerRadius: 10)
        editTextFields(enterTextFieldName: reEnterPassword, CornerRadius: 10)
        editButtons(button: signUpButton, cornerRadius: 15)
        gifImage()
    }
    
    //MARK: - This will load the and display the gif in UIImageView
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }
    
    //MARK: - This is function if for add icon to the left in the text field
    func addLeftImageTo(txtField: UITextField, imageName: String) {
        
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 26, height: 26))
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
    
    //MARK: - This IBAction will navigation to Menu page.
    @IBAction func signUpButton(_ sender: UIButton) {
        
        if enterYourName.text == "" && enterYourEmail.text == "" && enterPassword.text == "" && enterPassword.text == "" {
            showAlert(title: "Re-Enter", message: "Please Enter Name, E-Mail and Password")
        } else if enterYourName.text == "" {
            showAlert(title: "Re-Enter", message: "Please Enter the Name")
        } else if enterPassword.text == "" {
            showAlert(title: "Re-Enter", message: "Please Enter the Password")
        } else if reEnterPassword.text == "" {
            showAlert(title: "Re-Enter", message: "Please Enter Password")
        } else {
            if enterPassword.text == reEnterPassword.text {
                if let email = enterYourEmail.text, let password = enterPassword.text {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e)
                        } else {
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let homeTabBarViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarViewController") as! HomeTabBarViewController
                            self.navigationController?.pushViewController(homeTabBarViewController, animated: true)
                        }
                    }
                }
            } else {
                showAlert(title: "The Password is not same", message: "Re-Enter the Password")
            }
        }
    }
    
}
