//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//
import UIKit
import IQKeyboardManagerSwift

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
        //MARK: - Calling The Video function to load that mp4 video into the UIView.
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
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
    
    //MARK: - This IBAction will navigation to Menu page.
    @IBAction func signUpButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        starAnimation.stopAnimating()
        let homeTabBarViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarViewController") as! HomeTabBarViewController
        navigationController?.pushViewController(homeTabBarViewController, animated: true)
    }
    
}
