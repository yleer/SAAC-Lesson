//
//  VisionApiManager.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/27.
//

import UIKit.UIImage
import Alamofire
import SwiftyJSON

class VisionApiManager{
    static let shared = VisionApiManager()
    
    func fetchData(image: UIImage, result : @escaping (Int, JSON)-> ()){
        typealias CompletionHandler =  (Int, JSON) -> ()
        
        
            let header: HTTPHeaders =  [
                "Authorization" :"KakaoAK a99b0644d3c5ac2b7f2ecdebbe63ff36",
                "Content-Type" : "multipart/form-data"
            ]
        
        guard let imageData = image.pngData() else{ return }
            
 
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "image", fileName: "image", mimeType: nil)
               
            }, to: "https://dapi.kakao.com/v2/vision/face/detect" , headers : header)
                .validate(statusCode: 200...500).responseJSON { response in
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
