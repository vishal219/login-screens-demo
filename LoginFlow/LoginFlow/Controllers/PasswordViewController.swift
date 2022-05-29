//
//  PasswordViewController.swift
//  LoginFlow
//
//  Created by vishalthakur on 28/05/22.
//

import UIKit

class PasswordViewController: UIViewController {
    
    //Variables:
    var email: String = ""
    private var rememberMeChecked: Bool = false
    
    //Outlets:
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWithGoogle : UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rememberMeButton: UIButton!
    
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
            RequestManager.shared.loginUserWithPassword(email, text, completion: {(loggedIn,error) in
                if loggedIn{
                    print("Logged In user")
                    //Save details & Go to dashboard
                }
                else{
                    if error != nil{
                        self.view.makeToast("Error logging in")
                    }
                    else{
                        self.view.makeToast("Incorrect password")
                    }
                }
            })
        }
        else{
            self.view.makeToast(String.makeEmptyMessage("Password"))
        }
    }
    
    @IBAction func generateOTP(_ sender: Any) {
        RequestManager.shared.generateOTP(email, completion: {(generated,message,error) in
            if generated{
                print("OTP generated !!")
                self.view.makeToast(message)
                //Move to OTP screen
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                if error != nil{
                    self.view.makeToast("Unable to send OTP")
                }
                else{
                    self.view.makeToast(message)
                }
            }
        })
    }
    
    @IBAction func rememberMeCheckUncheck(_ sender: Any) {
        if rememberMeChecked{
            rememberMeButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
        else{
            rememberMeButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
        rememberMeChecked = rememberMeChecked == true ? false : true
    }
    
}
