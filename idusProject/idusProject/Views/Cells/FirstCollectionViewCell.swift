//
//  FirstCollectionViewCell.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    @IBOutlet var innerCollectionView: UICollectionView!
    
    
    var images: [BannerImg] = []
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            networking()
            innerCollectionView.delegate = self
            innerCollectionView.dataSource = self
           
    }
    
    
    
    }

    extension FirstCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstInnerCellIdentifier", for: indexPath) as? FirstCollectionContentViewCell else { return UICollectionViewCell() }
            
            cell.bind(model: images[indexPath.item])
            
            return cell
        }
        
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = 375
                       let height = width * (268 / 375)
                       return CGSize(width: width, height: height)
        }
        
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//               
//               return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//           }
//           
//           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//               return 0
//           }
//           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//               return 0
//           }
        
      
}


extension FirstCollectionViewCell {
    func networking(){
        BannerService.shared.loadBanner{ data in
            if let metaData = data {
                self.images = metaData
                self.innerCollectionView.reloadData()
            }
        }
    }
}
