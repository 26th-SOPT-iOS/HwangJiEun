//
//  FriendsTableViewCell.swift
//  login_sopt
//
//  Created by 황지은 on 2020/05/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    static let identifier:String = "friendsCell"
    
    @IBOutlet var imageHeight: NSLayoutConstraint!
    @IBOutlet var imageBottomConstraints: NSLayoutConstraint!
    @IBOutlet var imageTopConstraints: NSLayoutConstraint!
    @IBOutlet var imageToLabelConstraints: NSLayoutConstraint!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var friendsNameLabel: UILabel!
    @IBOutlet var friendsImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setProfileInformation(profileImg:UIImage,profileName:String,profileStatus:String){
        friendsImg.image = profileImg
        friendsNameLabel.text = profileName
        statusLabel.text = profileStatus
    }
    
    
}
