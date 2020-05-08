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
    
}

    extension UITextField {
    func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
      }
    }

