//
//  FirstCollectionContentViewCell.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class FirstCollectionContentViewCell: UICollectionViewCell {
    
    @IBOutlet var bannerImg: UIImageView!
    
    
    
    
    func bind (model:BannerImg){
        guard let imageURL = URL(string: model.img!) else { return }
               
        bannerImg.image = UIImage(contentsOfFile: model.img!)
              
               do {
                   let data = try Data(contentsOf: imageURL)
                   bannerImg.image = UIImage(data: data)
               } catch (let err) {
                   print(err.localizedDescription)
               }

    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         bannerImg.clipsToBounds = true
      

    }
}
