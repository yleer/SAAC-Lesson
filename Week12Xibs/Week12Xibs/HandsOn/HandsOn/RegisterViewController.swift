//
//  RegisterViewController.swift
//  HandsonProject
//
//  Created by Yundong Lee on 2021/11/08.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet var numberTextField: UIView!
    @IBOutlet weak var locationPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationPicker.delegate = self
        locationPicker.dataSource = self
    }
    
    let location = [
        "서울특별시","부산광역시","인천광역시", "대구광역시", "대전광역시", "광주광역시","울산광역시","경기도","경기도", "강원도",
        "충청북도", "충청남도","전라남도","전라북도","경상남도", "경상북도"
    ]
    
    
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
//        let id = idTextField.text
//        let password = passwordTextField.text
//        let email = emailTextField.text
        let location = location[locationPicker.selectedRow(inComponent: 0)]
        print(location)
        
        
//        let parameters: [String: String] = [
//            "source": "ko",
//            "target": "en",
//            "text": "안녕하세요"
//        ]
//        
//        url = "https://openapi.naver.com/v1/papago/n2mt"
//       
//        let headers: HTTPHeaders = [
//            "X-Naver-Client-Id": "sbF_TwlMoLeQ5c6xgcEe",
//            "X-Naver-Client-Secret": "hIlG3W6Ymj"
//        ]
//
//        AF.request(url, method: .post, parameters: parameters, headers: headers).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("통신 성공")
//                print("JSON: \(json)")
//            case .failure(let error):
//                print("에러 발생")
//                print(error)
//            }
//        }
        
    }
    

}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        location.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        location[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    
    
}


