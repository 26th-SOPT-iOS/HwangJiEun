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
        
        guard let joinInputID = joinIdTextField.text else {return}
        guard let joinInputPWD = joinPasswordTextField.text else {return}
        guard let joinInputName = joinNameTextField.text else {return}
        guard let joinInputEmail = email.text else {return}
        guard let joinInputPhone = phone.text else {return}
        
        SignupService.shared.signup(id: joinInputID, pwd: joinInputPWD, name: joinInputName, email: joinInputEmail, phone: joinInputPhone) {
            networkResult in
            switch networkResult{
            case .success:
                //회원가입 절차가 성공했을 때 로그인 서비스를 불러옴
                LoginService.shared.login(id: joinInputID, pwd: joinInputPWD) {
                networkResults in
                switch networkResults{
                    //토큰을 받아옴
                case .success(let token):
                    guard let token = token as? String else {return}
                    UserDefaults.standard.set(token, forKey: "token")
                  
                    //회원가입뷰와 로그인뷰간의 데이터 전달과정
                    guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? ViewController else {return}
                    //로그인뷰의 아이디필드를 회원가입 아이디로
                    receiveViewController.id = joinInputID
                    //로그인뷰의 패스워드필드를 회원가입 패스워드로
                    receiveViewController.password = joinInputPWD
                    
                    //로그인뷰로 가는과정
                    self.navigationController?.show(receiveViewController, sender: self)
                    
                    //로그인이 성공했으니 탭바로 이동!
                    guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else {return}
                    tabbarController.modalPresentationStyle = .fullScreen
                    self.present(tabbarController, animated: true, completion: nil)
                    
                case .requestErr(let message):
                    guard let message = message as? String else {return}
                    let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
                case .pathErr: print("path")
                case .serverErr: print("serverErr")
                case .networkFail: print("networkfail")
                    
                }
            }
                
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
        self.navigationController?.popToRootViewController(animated: true)
        
      }
      
   
    
}

