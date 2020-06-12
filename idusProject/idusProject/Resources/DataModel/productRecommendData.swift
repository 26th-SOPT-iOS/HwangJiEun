//
//  productRecommendData.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/12.
//  Copyright © 2020 황지은. All rights reserved.
//

import Foundation

struct productRecommendData:Codable {
    
    var status:Int
    var success:Bool
    var message:String
    var data:[RecommendData]   
}

struct RecommendData:Codable{
    var recommendIdx:Int?
    var name:String?
    var img:String?
    var price:Int?
    var Info:String?
    var productRecommandIdx:Int?
    var status:String?
}
