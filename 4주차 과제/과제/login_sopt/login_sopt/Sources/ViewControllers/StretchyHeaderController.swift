//
//  StretchyHeaderController.swift
//  login_sopt
//
//  Created by 황지은 on 2020/05/01.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class StretchyHeaderController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var imageVIew: UIImageView!
    @IBOutlet var myView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var imgHeigh: NSLayoutConstraint!
    
    var LogoTopHeight:CGFloat = 210
    var LogoTopmin:CGFloat = 108
    
    var HeightConstant: CGFloat!
    
      override func viewDidLoad() {
        super.viewDidLoad()
       //scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        
    }
    @IBAction func logoutBtn(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: UserDefaultKeys.checkautoLogin)
        self.dismiss(animated: true, completion: nil)
    }
    
}



