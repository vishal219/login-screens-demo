//
//  ViewController.swift
//  LoginFlow
//
//  Created by vishalthakur on 28/05/22.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {
    
    //Outlets:
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    
    @IBOutlet weak var emailOrMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // button corners & borders added
        continueButton.layer.cornerRadius = UI.cornerRadiusButton1
        googleLoginButton.layer.cornerRadius = UI.cornerRadiusButton2
        googleLoginButton.layer.borderColor = UI.lightBorder
        googleLoginButton.layer.borderWidth = UI.thinBorder
        emailOrMobile.attributedPlaceholder = NSAttributedString(
            string: "Mobile Number or Email Id",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
    }
    
    //Actions:
    //Login User
    @IBAction func continueLogin(_ sender: Any){
        if let text = emailOrMobile.text,!text.isEmpty{
            if text.isValidEmail || text.isValidPhone{
                self.view.makeToastActivity(.center)
                RequestManager.shared.CheckUser(text, completion: {(loggedIn,error) in
                    self.view.hideToastActivity()
                    if loggedIn{
                        print("User verified")
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
                        vc.email = text
                        let navigation = UINavigationController(rootViewController: vc)
                        navigation.navigationBar.isHidden = true
                        navigation.modalPresentationStyle = .fullScreen
                        self.present(navigation, animated: true, completion: nil)
                    }
                    else{
                        if error != nil{
                            self.view.makeToast("Can't login user. Try Again.")
                        }
                        else{
                            print("Not logged in")
                            self.view.makeToast("User not found")
                        }
                    }
                })
            }
            else{
                self.view.makeToast("Invalid credentials")
            }
        }
        else{
            self.view.makeToast(String.makeEmptyMessage("email or phone"))
        }
    }
}

