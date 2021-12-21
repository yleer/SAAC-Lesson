//
//  ApiService.swift
//  Week3
//
//  Created by Yundong Lee on 2021/12/21.
//

import Foundation

class ApiService {
    
    let sourceUrl = URL(string: "https://kobis.or.kr/kobisopenapi/webservice/rest/people/searchPeopleList.json?key=f5eef3421c602c6cb7ea224104795888")!
    
    func requestCast(completion: @escaping (Cast?) -> Void) {
        URLSession.shared.dataTask(with: sourceUrl) { data, response, error in
            print(data, response, error)
            if let error = error {
//                print("error occured")
                self.showAlert(.unknownError)
                return
            }
            guard let response = response as?  HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                print("error")
                self.showAlert(.serverError)
                return
            }
            
            if let data = data, let castData = try? JSONDecoder().decode(Cast.self, from: data)  {
                print("good", castData)
                completion(castData)
                return
            }
            completion(nil)
        }.resume()
        
    }
    
    
    
    func showAlert(_ msg: ApiError){
    
        
    }
}
