//
//  SecondCollectionViewCell.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var innerCollectionView: UICollectionView!
    
    
    
    var images: [RecommendData] = []
           
           override func awakeFromNib() {
               super.awakeFromNib()
               

               networking()
               innerCollectionView.delegate = self
               innerCollectionView.dataSource = self

           }
       }

       extension SecondCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
           
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
           }
           
           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               
               guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondInnerCellIdentifier", for: indexPath) as? SeondCollectionContentViewCell else { return UICollectionViewCell() }
               
            cell.bind(model:images[indexPath.item])
            cell.productImg.frame.size = CGSize(width: 165, height: 158)
              
               return cell
           }
        
           
         
    
}

extension SecondCollectionViewCell{
    func networking(){
        productRecommendService.shared.loadProductRecommend { data in
                   if let metaData = data {
                       self.images = metaData
                       self.innerCollectionView.reloadData()
                   }
            
        }
        
    }
}
