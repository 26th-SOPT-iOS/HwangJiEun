//
//  ViewController.swift
//  W02_iOS_Assignment
//
//  Created by 황지은 on 2020/04/28.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calculator_btn: [UIButton]!
    @IBOutlet var operators: [UIButton]!
    

        override func viewDidLoad() {
            super.viewDidLoad()
        // Do any additional setup after loading the view.
            setLayer()
            setOperatorLayer()
           

    }

    func setLayer(){
        
        calculator_btn.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.width*0.5
        })
    }
    
    func setOperatorLayer(){
        operators.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.width*0.5
        })
        
    }
}

