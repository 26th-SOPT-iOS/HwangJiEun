//
//  ThirdCollectionViewCell.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var innerCollectionView: UICollectionView!
    

        
           let images: [UIImage] = [
                                        UIImage(imageLiteralResourceName: "screenShot20200522At122629Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At122732Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At122832Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At122948Am"),
                                        UIImage(imageLiteralResourceName: "screenShot20200522At123205Am")
               ]
               
    
    let category: [String] = ["디저트","폰 케이스","천연비누","디퓨저","화장품"]
               override func awakeFromNib() {
                   super.awakeFromNib()
                   

                   innerCollectionView.delegate = self
                   innerCollectionView.dataSource = self

               }
           }

           extension ThirdCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
               
               func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return images.count
               }
               
               func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   
                   guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdInnerCellIdentifier", for: indexPath) as? ThridCollectionContentViewCell else { return UICollectionViewCell() }
                
         
                cell.thirdProductImg?.image = images[indexPath.item]
                cell.thirdProductLabel?.text = category[indexPath.item]
                  
                   return cell
               }
            
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
            }
               
             
        
    }

