//
//  TranslateAPIManager.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/27.
//

import Foundation
import Alamofire
import SwiftyJSON

class TranslateAPIManager{
    static let shared = TranslateAPIManager()
    
    
    typealias CompletionHandler =  (Int, JSON) -> ()
    func fetchData(text : String, result: @escaping CompletionHandler){
        let header: HTTPHeaders =  [
            "X-Naver-Client-Id" : APIKey.NAVER_ID,
            "X-Naver-Client-Secret" : APIKey.NAVER_PASSWORD
        ]
        
        let body = [
            "source": "ko",
            "target": "en",
            "text" : text
        ]
        AF.request(EndPoint.translateURL, method: .post, parameters: body, headers: header ).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let code = response.response?.statusCode ?? 500
                result(code, json)
                
                
//                self.target.text = json["message"]["result"]["translatedText"].string
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
