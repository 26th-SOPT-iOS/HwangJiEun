//
//  JoinViewController.swift
//  login_26th
//
//  Created by 황지은 on 2020/04/19.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet var joinIdTextField: UITextField!
    @IBOutlet var joinPwTextField: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func jointoLoginBtn(_ sender: Any) {
        guard let receiveJoinData = self.storyboard?.instantiateViewController(identifier: "loginView") as? LoginViewController else {return}
        
        receiveJoinData.loginId = joinIdTextField.text
        receiveJoinData.loginPw = joinPwTextField.text
        
        self.present(receiveJoinData, animated: true, completion: nil)
    }
}
