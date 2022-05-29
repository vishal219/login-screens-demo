//
//  RequestManager.swift
//  LoginFlow
//
//  Created by vishalthakur on 28/05/22.
//

import Foundation
import Alamofire

class RequestManager {
    static let shared = RequestManager()
    
     func postData (fromRequestType request : HTTPMethod,url: URL, data : [String : Any], completion : @escaping (Any?, Error?) -> ()) {
        
        

        AF.request(url, method: request, parameters: data, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
                            case .success(let value):
                                if let JSON = value as? [String: Any] {
                                    completion(JSON, nil)
                                }
                            case .failure(let error):
                                // error handling
                                    completion(nil, error)
                            }

        }
    }
    // MARK: - PUBLIC
    ///Check if user exists or not
    /// - Parameters
    ///         - email: string representing email or phone number
    func CheckUser(_ email: String,completion: @escaping (Bool,Error?) -> ()){
        let data = ["username": email]
        if let url = URL.init(string: check_login_url){
            self.postData(fromRequestType: .post, url: url, data: data, completion: {(sucess,error) in
                if sucess != nil{
                    let response = sucess as? [String:Any]
                    if let status = response?["status"]{
                        if let code = status as? Int{
                            if code == 1{
                                completion(true,nil)
                            }
                            else{
                                completion(false,nil)
                            }
                        }
                    }
                }
                else if error != nil{
                    print(error)
                    completion(false,error)
                }
            })
        }
        
    }
    // MARK: - PUBLIC
    ///Login User with username & password
    /// - Parameters
    ///         - email: string representing email or phone number
    ///         - password: string representing password
    func loginUserWithPassword(_ email: String,_ password: String,completion: @escaping (Bool,Error?) -> ()){
        let data = [
            "username" : email,
            "password" : password,
            "device_type" : "android",
            "device_token" : "jlhyfhaoiffj"
        ]
        if let url = URL.init(string: login_password_url){
            self.postData(fromRequestType: .post, url: url, data: data, completion: {(sucess,error) in
                
            })
        }
    }
    // MARK: - PUBLIC
    ///login user with username & otp
    /// - Parameters
    ///         - email: string representing email or phone number
    ///         - otp: string representing OTP sent to user
    func loginUserWithOTP(_ email: String,_ otp: Int,completion: @escaping (Bool,Error?) -> ()){
        let data = [
            "username" : email,
            "device_type" : "android",
            "device_token" : "jlhyfhaoiffj",
            "otp" : 4526
        ] as [String : Any]
        if let url = URL.init(string: login_OTP_url){
            self.postData(fromRequestType: .post, url: url, data: data, completion: {(sucess,error) in
                
            })
        }
    }
    // MARK: - PUBLIC
    ///Generate OTP
    /// - Parameters
    ///         - email: string representing email or phone number
    func generateOTP(_ email: String,completion: @escaping (Bool,String?,Error?) -> ()){
        let data = [
            "username" : email,
            "device_type" : "android",
            "device_token" : "jlhyfhaoiffj"
        ] as [String : Any]
        if let url = URL.init(string: generate_OTP_url){
            self.postData(fromRequestType: .post, url: url, data: data, completion: {(sucess,error) in
                if sucess != nil{
                    let response = sucess as? [String:Any]
                    if let status = response?["status"]{
                        if let code = status as? Int{
                            //force unwrap as value expected always
                            let message = response?["message"] as! String
                            if code == 1{
                                completion(true,message,nil)
                            }
                            else{
                                completion(false,message,nil)
                            }
                        }
                    }
                }
                else if error != nil{
                    print(error)
                    completion(false,nil,error)
                }
            })
        }
    }
}


