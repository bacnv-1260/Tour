//
//  ViewController.swift
//  Tour
//
//  Created by nguyen.van.bac on 6/3/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var btnLoginFb: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if FBSDKAccessToken.current() != nil {
             self.showAlertLogin()
            btnLoginFb.isEnabled = false
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func onLoginFb(_ sender: Any) {
        let LoginManager = FBSDKLoginManager()
        LoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                self.showAlert(message: "Failed to login: \(error.localizedDescription)")
                return
            }
            guard let accessToken = FBSDKAccessToken.current() else {
                self.showAlert(message: "Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            Auth.auth().signInAndRetrieveData(with: credential) { (user, error) in
                if let error = error {
                    self.showAlert(message: "Login error: \(error.localizedDescription)")
                    return
                }
               
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Thông báo",
                                      message: message ,
                                      preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showAlertLogin(){
        let string:String = "Để đảm bảo an toàn cho chuyến đi của bạn và người khác, việc cung cấp thông tin là cần thiết. Thông tin này sẽ được chúng tôi giữa kín và không cung cấp cho một bên thứ 3"
        let alert = UIAlertController(title: nil,
                                      message: string,
                                      preferredStyle: .alert);
        alert.view.backgroundColor = UIColor.white
        alert.view.layer.cornerRadius = 10
        
        alert.addAction(UIAlertAction.init(title: "Thêm ngay", style: .default) { (alert) in
            let homeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
            let homeViewController = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window!.rootViewController = homeViewController
        
        })
        alert.addAction(UIAlertAction(title: "Thêm sau", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
}

