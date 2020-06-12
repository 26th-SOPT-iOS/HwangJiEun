//
//  SeondCollectionContentViewCell.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class SeondCollectionContentViewCell: UICollectionViewCell {
    
    @IBOutlet var productImg: UIImageView!
    @IBOutlet var productConceptLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    
    
    func bind (model:RecommendData){
        guard let imageURL = URL(string: model.img!) else { return }
        guard let price = model.price else {return}
               
        productImg.image = UIImage(contentsOfFile: model.img!)
        productImg.sizeToFit()
        productConceptLabel.text = model.Info
        productConceptLabel.sizeToFit()
        productNameLabel.text = model.name
        productPriceLabel.text = "\(price)"
        
               do {
                   let data = try Data(contentsOf: imageURL)
                   productImg.image = UIImage(data: data)
                productImg.frame.size = CGSize(width: 165, height: 158)
               } catch (let err) {
                   print(err.localizedDescription)
               }

    }
    
    
}
