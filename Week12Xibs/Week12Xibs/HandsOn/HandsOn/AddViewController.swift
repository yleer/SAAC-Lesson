//
//  AddViewController.swift
//  HandsOnProject
//
//  Created by Yundong Lee on 2021/11/15.
//

import UIKit
import Alamofire
import PhotosUI


class AddViewController: UIViewController {

    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var selectedImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        
        
        
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
    
    @IBAction func addImagesButtonClicked(_ sender: UIBarButtonItem) {
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        let pickerView = PHPickerViewController(configuration: configuration)
        pickerView.delegate = self
        present(pickerView, animated: true, completion: nil)
        
        
    }
}

extension AddViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) {(image, error) in
                
                guard let image = image as? UIImage else {
                    return
                }
                DispatchQueue.main.async {
                    self.selectedImageView.image = image
                }
            }
        }

        
        
        picker.dismiss(animated: true, completion: nil)
    }
}
