//
//  ScrollViewController.swift
//  login_sopt
//
//  Created by 황지은 on 2020/04/29.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit


class ScrollViewController: UIViewController {
    


    @IBOutlet var imgHeight: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
    
    
    var LogoTopHeight:CGFloat = 210
    var LogoTopmin:CGFloat = 108
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never

    }
   

}

extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let stretchedHeight = -scrollView.contentOffset.y

        if stretchedHeight + self.LogoTopHeight > 88 {
                self.imgHeight.constant = self.LogoTopHeight + stretchedHeight

        }
        else {
            self.imgHeight.constant = 88
        }
    }
}
