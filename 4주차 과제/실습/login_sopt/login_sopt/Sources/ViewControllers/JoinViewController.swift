//
//  JoinViewController.swift
//  login_sopt
//
//  Created by 황지은 on 2020/04/29.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet var joinIdTextField: UITextField!
    @IBOutlet var joinPasswordTextField: UITextField!
    @IBOutlet var joinNameTextField: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phone: UITextField!
    
    @IBOutlet var joinCompleteBtn: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        joinNameTextField.addLeftPadding()
        joinIdTextField.addLeftPadding()
        joinPasswordTextField.addLeftPadding()
        email.addLeftPadding()
        phone.addLeftPadding()
        
        joinNameTextField.layer.cornerRadius = 22.0
        joinNameTextField.layer.borderWidth = 1.0
        joinNameTextField.layer.borderColor = UIColor.white.cgColor
        
        joinIdTextField.layer.cornerRadius = 22.0
        joinIdTextField.layer.borderWidth = 1.0
        joinIdTextField.layer.borderColor = UIColor.white.cgColor
        
        joinPasswordTextField.layer.cornerRadius = 22.0
        joinPasswordTextField.layer.borderWidth = 1.0
        joinPasswordTextField.layer.borderColor = UIColor.white.cgColor
        
        
        email.layer.cornerRadius = 22.0
        email.layer.borderWidth = 1.0
        email.layer.borderColor = UIColor.white.cgColor
        
        
        phone.layer.cornerRadius = 22.0
        phone.layer.borderWidth = 1.0
        phone.layer.borderColor = UIColor.white.cgColor
        
        
        
        joinCompleteBtn.layer.cornerRadius = 24.0
        
    }
    
    @IBAction func join(_ sender: UIButton) {
        
        guard let inputID = joinIdTextField.text else {return}
        guard let inputPWD = joinPasswordTextField.text else {return}
        guard let inputName = joinNameTextField.text else {return}
        guard let inputEmail = email.text else {return}
        guard let inputPhone = phone.text else {return}
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputName, email: inputEmail, phone: inputPhone) {
            networkResult in
            switch networkResult{
            case .success:
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else {return}
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else {return}
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkfail")
                
            }
        }
    }
    @IBAction func joinToMain(_ sender: UIButton) {
   
        
      }
      
    
    
    
}

