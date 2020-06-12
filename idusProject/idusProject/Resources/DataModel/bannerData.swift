//
//  bannerData.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/12.
//  Copyright © 2020 황지은. All rights reserved.
//

import Foundation

struct bannerData:Codable {
    
    var status:Int
    var success:Bool
    var message:String
    var data:[BannerImg]
    
}
//    enum Codingkeys:String,CodingKey {
//        case status = "status"
//        case success = "success"
//        case message = "message"
//        case data = "data"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: Codingkeys.self)
//        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
//        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
//        message = (try? values.decode(String.self, forKey: .message)) ?? ""
//        data = (try? values.decode([BannerImg].self, forKey: .data)) ?? nil
//    }
//}

struct BannerImg:Codable {
    var imgIdx:Int?
    var img:String?
}
