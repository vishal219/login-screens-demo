//
//  Constants.swift
//  LoginFlow
//
//  Created by vishalthakur on 28/05/22.
//

import Foundation
import UIKit

//check User exists or not
let check_login_url = "http://emapp.brandmydream.com/evobee/demo/check_login"

//Login user with password
let login_password_url = "http://emapp.brandmydream.com/evobee/demo/business_login"

//Generate OTP
let generate_OTP_url = "http://emapp.brandmydream.com/evobee/demo/login_with_otp"

//Login with OTP
let login_OTP_url = "http://emapp.brandmydream.com/evobee/demo/login_with_otp"

let appDelegate = UIApplication.shared.delegate as! AppDelegate

struct UI{
    //for centre screen capsule buttons
    static let cornerRadiusButton1 = 30.0
    //for corner curved buttons
    static let cornerRadiusButton2 = 8.0
    //for light colored borders
    static let lightBorder = UIColor.lightGray.cgColor
    //for border widths
    static let thinBorder = 0.5
}


