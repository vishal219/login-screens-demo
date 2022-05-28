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
        OTP.configure()
        // Do any additional setup after loading the view.
    }
    

    
    @IBOutlet weak var OTP: AEOTPTextField!
    
}
