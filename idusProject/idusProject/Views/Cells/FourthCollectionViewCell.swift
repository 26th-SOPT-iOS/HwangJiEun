//
//  FourthCollectionViewCell.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/10.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class FourthCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var innerCollectionView: UICollectionView!
   
           let images: [UIImage] = [
                                        UIImage(imageLiteralResourceName: "screenShot20200522At123508Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At123836Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At123508Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At123836Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At123508Am")
               ]
               
               override func awakeFromNib() {
                   super.awakeFromNib()
                   

                   innerCollectionView.delegate = self
                   innerCollectionView.dataSource = self

               }
           }

           extension FourthCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
               
               func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return images.count
               }
               
               func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   
                   guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthInnerCellIdentifier", for: indexPath) as? FourthCollectionCotentViewCell else { return UICollectionViewCell() }
                
         
                cell.FourthProductImg?.image = images[indexPath.item]
                  
                   return cell
               }
            
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
            }
               
             
        
    }
