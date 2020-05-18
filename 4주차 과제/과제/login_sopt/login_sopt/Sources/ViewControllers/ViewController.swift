//
//  ViewController.swift
//  login_sopt
//
//  Created by 황지은 on 2020/04/29.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var joinBtn: UIButton!
    var id:String?
    var password:String?
    
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont.systemFont(ofSize: 15),
    .foregroundColor: UIColor.gray,
    .underlineStyle: NSUnderlineStyle.single.rawValue]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.layer.cornerRadius = 22.0
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.cornerRadius = 22.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        
        loginBtn.layer.cornerRadius = 24.0
        
        emailTextField.addLeftPadding()
        passwordTextField.addLeftPadding()
        
        navigationController?.isNavigationBarHidden = true
        
        let attributeString = NSMutableAttributedString(string: "회원가입 하기",attributes: yourAttributes)
        joinBtn.setAttributedTitle(attributeString, for: .normal)
        

    }
   override func viewWillAppear(_ animated: Bool) {
    setData()
    }
    
    @IBAction func login(_ sender: UIButton) {
        guard let inputID = emailTextField.text else {return}
        guard let inputPWD = passwordTextField.text else {return}
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) {
            networkResult in
            switch networkResult{
            case .success(let token):
                guard let token = token as? String else {return}
                UserDefaults.standard.set(token, forKey: "token")
              
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
        
    }
    
    func setData(){
        guard let id = self.id else {return}
        guard let password = self.password else {return}
        
        emailTextField.text = id
        passwordTextField.text = password
       }
       

    
}

    extension UITextField {
    func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
      }
    }

