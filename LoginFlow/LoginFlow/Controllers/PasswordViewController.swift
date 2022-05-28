//
//  PasswordViewController.swift
//  LoginFlow
//
//  Created by vishalthakur on 28/05/22.
//

import UIKit

class PasswordViewController: UIViewController {
    
    //Outlets:
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWithGoogle : UIButton!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = UI.cornerRadiusButton1
        loginWithGoogle.layer.cornerRadius = UI.cornerRadiusButton2
        loginWithGoogle.layer.borderColor = UI.lightBorder
        loginWithGoogle.layer.borderWidth = UI.thinBorder
        password.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
    }
    

    //Actions:
    @IBAction func continueLogin(_ sender: Any) {
        if let text = password.text, !text.isEmpty{
            
        }
        else{
            self.view.makeToast(String.makeEmptyMessage("Password"))
        }
    }
    
    @IBAction func generateOTP(_ sender: Any) {
    }
    
    @IBAction func rememberMeCheckUncheck(_ sender: Any) {
    }
    
}
