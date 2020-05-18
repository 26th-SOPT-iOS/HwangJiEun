//
//  FriendsInformation.swift
//  login_sopt
//
//  Created by 황지은 on 2020/05/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

struct FreindsInformation{
    var profileImg: UIImage?
    var profileName:String
    var statusLabel:String

    init(profileImg: UIImage, profileName:String, statusLabel:String){
        self.profileImg = profileImg
        self.profileName = profileName
        self.statusLabel = statusLabel
    }
}
