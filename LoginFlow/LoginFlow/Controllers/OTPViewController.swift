//
//  OTPViewController.swift
//  LoginFlow
//
//  Created by vishalthakur on 28/05/22.
//

import UIKit
import AEOTPTextField

class OTPViewController: UIViewController,AEOTPTextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        print("CODE: \(code)")
    }
    

    var email: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        OTP.otpDelegate = self
        OTP.configure(with: 4)
        confirmButton.layer.cornerRadius = UI.cornerRadiusButton1
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var OTP: AEOTPTextField!
    
    
    @IBAction func confirmLogin(_ sender: Any) {
        if let text = OTP.text, !text.isEmpty{
            if Int(text) == 1234 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                vc.email = self.email
                var dic: [String:Any] = [:]
                dic["username"] = self.email
                appDelegate.dicloginDetail = dic as NSDictionary
                let data = NSKeyedArchiver.archivedData(withRootObject: appDelegate.dicloginDetail)
                
                UserDefaults.standard.set(data, forKey: "LoginDetail")
                UserDefaults.standard.synchronize()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                self.view.makeToast("OTP does'nt match")
            }
        }
        else{
            self.view.makeToast(String.makeEmptyMessage("OTP"))
        }
    }
    @IBAction func resendOTP(_ sender: Any) {
        RequestManager.shared.generateOTP(email, completion: {(generated,message,error) in
            if generated{
                print("OTP generated !!")
                self.view.makeToast(message)
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
    
}
