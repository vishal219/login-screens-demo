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
    
    func CheckUser(_ email: String,completion: @escaping (Bool) -> ()){
        let data = ["username": email]
        if let url = URL.init(string: check_login_url){
            self.postData(fromRequestType: .post, url: url, data: data, completion: {(sucess,error) in
                if sucess != nil{
                    let response = sucess as? [String:Any]
                    if let status = response?["status"]{
                        if let code = status as? Int{
                            if code == 1{
                                completion(true)
                            }
                            else{
                                completion(false)
                            }
                        }
                    }
                }
                else if error != nil{
                    print(error)
                    completion(false)
                }
            })
        }
        
    }
    
    func loginUserWithPassword(_ email: String,_ password: String,completion: @escaping (Bool) -> ()){
        let data = [
            "username" : email,
            "password" : password
        ]
        if let url = URL.init(string: login_password_url){
            self.postData(fromRequestType: .post, url: url, data: data, completion: {(sucess,error) in
                
            })
        }
    }
    
    func loginUserWithOTP(_ email: String,_ otp: Int,completion: @escaping (Bool) -> ()){
        let data = [
            "username" : email,
            "otp" : otp
        ] as [String : Any]
        if let url = URL.init(string: login_password_url){
            self.postData(fromRequestType: .post, url: url, data: data, completion: {(sucess,error) in
                
            })
        }
    }
}


