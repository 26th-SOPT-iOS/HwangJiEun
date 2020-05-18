//
//  scrollplzViewController.swift
//  login_sopt
//
//  Created by 황지은 on 2020/05/08.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class scrollplzViewController: UIViewController {

    @IBOutlet var imghHeight: NSLayoutConstraint!
        @IBOutlet var scrollView: UIScrollView!
        
        
        var LogoTopHeight:CGFloat!
        var LogoTopmin:CGFloat = 108
    
    override func viewDidLoad() {
        super.viewDidLoad()

      scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
}
extension scrollplzViewController: UIScrollViewDelegate {
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let stretchedHeight = -scrollView.contentOffset.y

            if stretchedHeight + self.LogoTopHeight > 88 {
                    self.imghHeight.constant = self.LogoTopHeight + stretchedHeight

            }
            else {
                self.imghHeight.constant = 88
            }
        }
    }

