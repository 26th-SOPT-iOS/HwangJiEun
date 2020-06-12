//
//  productRecommendService.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/12.
//  Copyright © 2020 황지은. All rights reserved.
//

import Foundation
import Alamofire

struct productRecommendService {

static let shared = productRecommendService()
   
   func loadProductRecommend(completion:@escaping ([RecommendData]?)-> Void ) {
       
       
       let header: HTTPHeaders = ["Content-Type":"application/json"]
    let dataRequest = Alamofire.request(APIConstants.productRecommendURL,method: .get,parameters: nil,encoding: JSONEncoding.default, headers: header)
       
       dataRequest.responseJSON { dataResponse in
           switch dataResponse.result {
           case.success:
              // guard let statusCode = dataResponse.response?.statusCode else {return}
               guard let value = dataResponse.data else {return}
              // let networkResult = self.judge(by:statusCode,value)
               
               do{
                   let decoder = JSONDecoder()
                   let json = try decoder.decode(NetworkResult<RecommendData>.self, from: value )
                   if json.success {
                       completion(json.data)
                   }
                   else{
                       completion(nil)
                   }
               }
               catch (let err){
                   print(err.localizedDescription)
               }
           case.failure:
               completion(nil)
            
        }
        
    }
    
    }
}

