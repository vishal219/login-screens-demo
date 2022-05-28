//
//  ViewController.swift
//  LoginFlow
//
//  Created by vishalthakur on 28/05/22.
//

import UIKit

class ViewController: UIViewController {

    //Outlets:
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    
    @IBOutlet weak var emailOrMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // button corners & borders added
        continueButton.layer.cornerRadius = 30.0
        googleLoginButton.layer.cornerRadius = 8.0
        googleLoginButton.layer.borderColor = UIColor.lightGray.cgColor
        googleLoginButton.layer.borderWidth = 0.5
        emailOrMobile.attributedPlaceholder = NSAttributedString(
            string: "Mobile Number or Email Id",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
    }
    
    //Actions:
    @IBAction func continueLogin(_ sender: Any){
        
    }
}

