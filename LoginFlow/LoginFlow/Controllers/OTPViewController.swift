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
    }
    @IBAction func resendOTP(_ sender: Any) {
    }
    
}
