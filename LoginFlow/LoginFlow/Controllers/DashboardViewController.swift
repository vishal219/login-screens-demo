//
//  DashboardViewController.swift
//  LoginFlow
//
//  Created by vishalthakur on 01/06/22.
//

import UIKit

class DashboardViewController: UIViewController {
    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        checkAuthentication()
        getStartedButton.layer.cornerRadius = UI.cornerRadiusButton2
        logoutButton.layer.cornerRadius = UI.cornerRadiusButton2
        logoutButton.layer.borderColor = UI.lightBorder
        logoutButton.layer.borderWidth = UI.thinBorder
        if let text = appDelegate.dicloginDetail?.value(forKey: "username") as? String{
            username.text = text
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var username: UILabel!
    
    @IBAction func getStartedAction(_ sender: Any) {
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "LoginDetail")
        UserDefaults.standard.synchronize()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Check if user logged in
    private func checkAuthentication(){
        if UserDefaults.standard.object(forKey: "LoginDetail") == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
