//
//  JoinViewController.swift
//  login_sopt
//
//  Created by 황지은 on 2020/04/29.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var joinEmailTextField: UITextField!
    @IBOutlet var joinPasswordTextField: UITextField!
    @IBOutlet var joinCompleteBtn: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.addLeftPadding()
        joinEmailTextField.addLeftPadding()
        joinPasswordTextField.addLeftPadding()
        
        nameTextField.layer.cornerRadius = 22.0
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor.white.cgColor
        
        joinEmailTextField.layer.cornerRadius = 22.0
        joinEmailTextField.layer.borderWidth = 1.0
        joinEmailTextField.layer.borderColor = UIColor.white.cgColor
        
        joinPasswordTextField.layer.cornerRadius = 22.0
        joinPasswordTextField.layer.borderWidth = 1.0
        joinPasswordTextField.layer.borderColor = UIColor.white.cgColor
        
        joinCompleteBtn.layer.cornerRadius = 24.0
        
    }
    
    @IBAction func joinToMain(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
      }
      
    
    
    
}

