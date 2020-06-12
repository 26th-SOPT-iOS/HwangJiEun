//
//  mainCollectionViewController.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import Alamofire


class mainCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setNavigationBar()
    }
    
    
    func setNavigationBar(){
        let image = UIImage(named: "homeBtnLogo")
        navigationItem.titleView = UIImageView(image: image)
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .darkGray
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.isTranslucent = false
        
    }

}

extension mainCollectionViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 4
  }
    
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.section {
      case 0:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCell", for: indexPath) as! FirstCollectionViewCell
        return cell
      case 1:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondSectionCell", for: indexPath) as! SecondCollectionViewCell
        return cell
      case 2:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdSectionCell", for: indexPath) as! ThirdCollectionViewCell
        return cell
    case 3:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthSectionCell", for: indexPath) as! FourthCollectionViewCell
        return cell
//    case 4:
//               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FifthSectionCell", for: indexPath) as! FifthSectionCell
//               return cell
//    case 5:
//           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sixthSectionCell", for: indexPath)
//           return cell
      default:
        assert(false, "Invalid element type")
    }
  }
    
    
  

}
extension mainCollectionViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            
            let width = collectionView.frame.width
            let height = width * (268 / 375)
            
            print("width : \(width), height : \(height)")
            return CGSize(width: width, height: height)
        }
        
        else if indexPath.section == 1 {
            let width = collectionView.frame.width
            let height = width * (285 / 375)
            
            print("width : \(width), height : \(height)")
            return CGSize(width: width, height: height)
        }
        
        else if indexPath.section == 2 {
            let width = collectionView.frame.width
                       let height = width * (146 / 375)
                       
                       print("width : \(width), height : \(height)")
                       return CGSize(width: width, height: height)
        }
        else{
            let width = collectionView.frame.width
                                 let height = width * (285 / 375)
                                 
                                 print("width : \(width), height : \(height)")
                                 return CGSize(width: width, height: height)
        }
    }
    
 //헤더,푸터뷰 상속받아 reusable하기

    

}
