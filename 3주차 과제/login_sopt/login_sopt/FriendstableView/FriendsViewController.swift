//
//  FriendsViewController.swift
//  login_sopt
//
//  Created by 황지은 on 2020/05/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    
    
    //FriendsInformation.swift에서 만들어준 구조체를 이용해서 배열을 만든다
    private var profileList:[FreindsInformation] = []
    private var myList:[FreindsInformation] = []
    
    var friendsLabel = UILabel()
    
    @IBOutlet var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileList()
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        profileTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        
        
        showAlert(style: .actionSheet)
    }
    
    
    func showAlert(style: UIAlertController.Style){
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: style)
        
        let friendsSettng = UIAlertAction(title:"친구 관리", style: .default) { (action) in print ("친구 관리")}
        let allsetting = UIAlertAction(title:"전체 설정", style: .default) { (action) in print ("전체 설정")}
        
        let cancel = UIAlertAction(title:"취소", style: .cancel, handler: nil)
        
        alert.addAction(friendsSettng)
        alert.addAction(allsetting)
        alert.addAction(cancel)
        
        self.present(alert,animated: true,completion: nil)
    }
    
    
    
    private func setProfileList(){
        
        let me = FreindsInformation(profileImg:#imageLiteral(resourceName: "beauty_1585659625845.jpeg") , profileName: "황지은", statusLabel: "")
        let profile1 = FreindsInformation(profileImg:#imageLiteral(resourceName: "53DI1kjx_400x400.jpg"), profileName: "주디", statusLabel: "make the world a better place!")
        let profile2 = FreindsInformation(profileImg: #imageLiteral(resourceName: "UzJoXr2V.jpg") ,profileName: "닉", statusLabel: "It's called a hustle, sweetheart.")
        let profile3 = FreindsInformation(profileImg:#imageLiteral(resourceName: "alien.jpg"), profileName: "알린", statusLabel: "The Clawwwwwwwwwwwwwwww")
        let profile4 = FreindsInformation(profileImg:#imageLiteral(resourceName: "woody.png"), profileName: "우디", statusLabel: "Reach for the sky!")
        let profile5 = FreindsInformation(profileImg:#imageLiteral(resourceName: "buzz.jpg") , profileName: "버즈", statusLabel: "To Infinity, and Beyond!")
        let profile6 = FreindsInformation(profileImg:#imageLiteral(resourceName: "jessi.jpg"), profileName: "제시", statusLabel: "It's you! It's you! It's really you!")
        let profile7 = FreindsInformation(profileImg:#imageLiteral(resourceName: "forky.jpg") , profileName: "포키", statusLabel: "Trash~~~")
        let profile9 = FreindsInformation(profileImg: #imageLiteral(resourceName: "mike.jpg"),profileName: "마이크와죠스키", statusLabel: "Nothing is more important than our friendship.")
        let profile10 = FreindsInformation(profileImg:#imageLiteral(resourceName: "sherly.jpg") , profileName: "설리반", statusLabel: "Kitty has to go.")
        let profile11 = FreindsInformation(profileImg: #imageLiteral(resourceName: "boo.jpg"), profileName: "부", statusLabel: " booo")
        let profile12 = FreindsInformation(profileImg: #imageLiteral(resourceName: "profile1Img@3x.jpg"), profileName: "뽀애앵", statusLabel: "집에 가고싶다")
        let profile13 = FreindsInformation(profileImg:#imageLiteral(resourceName: "profile4Img@3x.jpg") , profileName: "뽀림이", statusLabel: "총총총총총총총총총")
   
        
        
        
        //위에 만들어놓은 빈 배열인 profileList에 데이터들이렇여을 넣어준다.
        profileList = [profile1,profile2,profile3,profile4,profile5,profile6,profile7,profile9,profile10,profile11,profile12,profile13]
        myList = [me]
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == .delete {
            self.profileList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            friendsLabel.text = "친구 \(profileList.count)"
            print(profileList.count)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        if section == 0{
            let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y: footerView.frame.height, width: tableView.frame.width - tableView.separatorInset.right - tableView.separatorInset.left - 14.5, height: 1))
            
            separatorView.backgroundColor = UIColor.lightGray
            footerView.addSubview(separatorView)
            
            
            friendsLabel = UILabel(frame: CGRect(x: 16, y: 9.5, width:tableView.bounds.size.width, height: 17))
            
            friendsLabel.font = UIFont(name: "KoPubWorldDotumPM", size: 11)
            friendsLabel.textColor = UIColor.lightGray
            friendsLabel.text = "친구 \(profileList.count)"
            friendsLabel.sizeToFit()
            footerView.addSubview(friendsLabel)
            
        }
        return footerView
    }
}

extension FriendsViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section==0 {
            return myList.count
        }
        else {
            return profileList.count
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier,for : indexPath) as? FriendsTableViewCell else {
            return UITableViewCell()
            
        }
        profileCell.friendsImg.layer.cornerRadius = profileCell.friendsImg.frame.height/2
        profileCell.friendsImg.layer.borderWidth = 1
        profileCell.friendsImg.layer.borderColor = UIColor.clear.cgColor
        // 뷰의 경계에 맞춰준다
        profileCell.friendsImg.clipsToBounds = true
        
        if indexPath.section == 1  {
            profileCell.setProfileInformation(profileImg:profileList[indexPath.row].profileImg!,profileName:profileList[indexPath.row].profileName,profileStatus:profileList[indexPath.row].statusLabel)
            
            profileCell.imageHeight.constant = 50
            profileCell.imageTopConstraints.constant = 6
            profileCell.imageBottomConstraints.constant = 7
            profileCell.imageToLabelConstraints.constant = 22
            
            
            
        }
        else {
            profileCell.imageHeight.constant = 60
            profileCell.imageTopConstraints.constant = 13
            profileCell.imageBottomConstraints.constant = 15.5
            profileCell.imageToLabelConstraints.constant = 13
        }
        
        
        if indexPath.section == 0 {
            profileCell.setProfileInformation(profileImg:myList[indexPath.row].profileImg!,profileName:myList[indexPath.row].profileName,profileStatus:myList[indexPath.row].statusLabel)
            
            profileCell.imageTopConstraints.constant = 13
            profileCell.imageBottomConstraints.constant = 15.5
            profileCell.imageToLabelConstraints.constant = 13
            profileCell.friendsNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
            profileCell.imageHeight.constant = 60
        }
        else {
            profileCell.imageHeight.constant = 50
            profileCell.imageTopConstraints.constant = 6
            profileCell.imageBottomConstraints.constant = 7
            profileCell.imageToLabelConstraints.constant = 22
            profileCell.friendsNameLabel.font = UIFont(name: "AppleSDGothicNeo", size: 17)
            
        }
        
        return profileCell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }
    
    
    
    
    
}



extension FriendsViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 88.5
        }
        else {
            return 70
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (indexPath)
    }
    
    
    
}
