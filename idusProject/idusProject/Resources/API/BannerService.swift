//
//  BannerService.swift
//  idusProject
//
//  Created by 황지은 on 2020/06/12.
//  Copyright © 2020 황지은. All rights reserved.
//

import Foundation
import Alamofire

struct BannerService {
    static let shared = BannerService()
    
    func loadBanner(completion:@escaping ([BannerImg]?)-> Void ) {
        
        
        let header: HTTPHeaders = ["Content-Type":"application/json"]
        let dataRequest = Alamofire.request(APIConstants.bannerURL,method: .get,parameters: nil,encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseJSON { dataResponse in
            switch dataResponse.result {
            case.success:
               // guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.data else {return}
               // let networkResult = self.judge(by:statusCode,value)
                
                do{
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(NetworkResult<BannerImg>.self, from: value )
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
    
//    private func judge(by statusCode:Int, _ data:Data) -> NetworkResult<Any>{
//        switch statusCode{
//        case 200: return isBanner(by: data)
//        case 400: return .pathErr
//        case 500: return .serverErr
//        default: return .networkFail
//        }
//    }
//
//    private func isBanner(by data:Data) -> NetworkResult<Any>{
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode(bannerData.self, from: data) else {return .pathErr}
//        guard let bannerImg = decodedData.data else {return .requestErr(decodedData.message)}
//        return .success()
//    }
//
}
