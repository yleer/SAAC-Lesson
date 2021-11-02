//
//  WeatherApiManager.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/27.
//

import Foundation
import MapKit
import Alamofire
import SwiftyJSON

class WeatherApiManager{
    
    static let shared = WeatherApiManager()
    
    func getData(lat: CLLocationDegrees, lon: CLLocationDegrees, result: @escaping (Int, JSON)->()){
        let url =  "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=187a57d104fda8aeb57bbd020e9918e4"
        
    
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let code = response.response?.statusCode ?? 500
                result(code, json)
            case .failure(let error):
                print(error)
            }
        }
        
        
        
        
    }
    
}
