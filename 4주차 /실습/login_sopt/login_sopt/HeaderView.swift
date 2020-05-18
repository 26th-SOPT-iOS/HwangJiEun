//
//  HeaderView.swift
//  login_sopt
//
//  Created by 황지은 on 2020/05/01.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    let imageView : UIImageView = {
        let iv = UIImageView(image:#imageLiteral(resourceName: "oursoptBgImg@2x.jpg") )
        iv.contentMode = .scaleAspectFill
        return iv
        
    }()


    override init(frame:CGRect) {
        super.init(frame:frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 

}
