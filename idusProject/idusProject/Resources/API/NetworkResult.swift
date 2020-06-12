//
//  NetworkResult.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/12.
//  Copyright © 2020 황지은. All rights reserved.
//

import Foundation

struct NetworkResult<T: Codable>: Codable {
    var success: Bool
    var message:String?
    var data:[T]?
}
