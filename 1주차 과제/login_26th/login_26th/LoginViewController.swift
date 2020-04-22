//
//  LoginViewController.swift
//  login_26th
//
//  Created by 황지은 on 2020/04/19.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginIdTextField: UITextField!
    @IBOutlet var loginPwTextField: UITextField!
    
    var loginId:String?
    var loginPw:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        
       //dismiss하기
       //presentedViewController : 자신이 호출한 ViewController
       // presentingViewController: 자신을 호출한 ViewController
        
        guard let presentingVC = self.presentingViewController else { return }
        
             //presentingViewController란 현재 view를 호출한 viewController를 의미하므로 현재 presentingVC는 JoinViewController가 된다!
        
        let navigationController = presentingVC is UINavigationController ? presentingVC as? UINavigationController : presentingVC.navigationController
       navigationController?.popToRootViewController(animated: false)

    
        
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
    private func setTextFields(){
        guard let loginId = self.loginId else {return}
        guard let loginPw = self.loginPw else {return}
        
        loginIdTextField.text = loginId
        loginPwTextField.text = loginPw
    }

}
