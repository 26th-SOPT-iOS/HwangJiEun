//
//  SigninData.swift
//  login_sopt
//
//  Created by 황지은 on 2020/05/16.
//  Copyright © 2020 황지은. All rights reserved.
//

import Foundation

struct SigninData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: TokenData?
    
    enum CodingKeys:String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
    }
}

struct TokenData: Codable {
    var jwt:String
}
