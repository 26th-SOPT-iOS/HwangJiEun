//
//  mainViewController.swift
//  login_26th
//
//  Created by 황지은 on 2020/04/19.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginOutlet: UIButton!
    @IBOutlet var joinOutlet: UIButton!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginOutlet.layer.cornerRadius = loginOutlet.bounds.size.height/3
        joinOutlet.layer.cornerRadius = loginOutlet.bounds.size.height/3
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginView") as? LoginViewController else {return}
        
        receiveViewController.loginId = idTextField.text
        receiveViewController.loginPw = pwTextField.text
        
        self.present(receiveViewController, animated: true, completion: nil)
        
        self.idTextField.text = " "
        self.pwTextField.text = " "
    }
    
    @IBAction func joinBtn(_ sender: Any) {
        self.idTextField.text = " "
        self.pwTextField.text = " "
    }
    
    
}
