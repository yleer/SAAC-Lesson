//
//  AddViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/01.
//

import UIKit
import PhotosUI
import RealmSwift

class AddViewController: UIViewController {
    
    // Open the local-only default realm
    let localRealm = try! Realm()
    
    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var contentTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.placeholder = LocalizableStrings.entert_text_placeholder.localized
        print("reaml is located : \(localRealm.configuration.fileURL!)")
    }
    
    
    @IBAction func dateButtonClicked(_ sender: UIButton) {
        
    }
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        let task = UserDiary(
            title: titleTextField.text!,
            content: contentTextView.text,
            createdDate: Date(),
            registerDate: Date()
        )
        try! localRealm.write {
            localRealm.add(task)
            if let realImage = uploadImage.image{
                saveImageToDocumentDirectory(imageName: "\(task._id).jpg", image: realImage)
            }
        }
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func addImagesButtonClicked(_ sender: UIBarButtonItem) {
        let alertVC = UIAlertController(title: "어떤 방식으로 이미지를 추가하시겠습니까?", message: "갤러리에서 이미지 가져오기, 사진찍기", preferredStyle: .alert)
        
        let fromGallaryButton = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            print("from gallary")
            var configuration = PHPickerConfiguration()
            configuration.filter = .images
            configuration.selectionLimit = 1
            
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = self
            self.present(picker, animated: true)
        }
        
        let fromCameraButton = UIAlertAction(title: "사진찍기", style: .default) { _ in
            print("from camera")
            // 카메라 추가는 필요할 때 하자.
        }
        
        alertVC.addAction(fromCameraButton)
        alertVC.addAction(fromGallaryButton)
        
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    func saveImageToDocumentDirectory(imageName: String, image: UIImage){
        // 1. 이미지 저장할 경로: 다큐먼트 경로(.documentDirectory) - FileManger가 관리
        // 샌드박스때문에 계속 위치가 바껴서 아래와 같이 경로 얻어옴.
        // ex) /user/ios/wee6app/
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        // 2. 이미지 파일 이름
        // ex) /user/ios/wee6app/image.jpg
        let imageUrl = documentDirectory.appendingPathComponent(imageName)
        
        
        // 3. 이미지 압축 (선택)
        guard let data = image.jpegData(compressionQuality: 0.3) else { return }
        
        // 4. 이미지 저장: 동일한 경로에 저장하게 될 경우, 덮어쓰기 됨
        // 4-1. 이미지 경로 확인.
        if FileManager.default.fileExists(atPath: imageUrl.path){
            
            // 4-2 기존 경로에 있는 이미지 삭제.
            do{
                try FileManager.default.removeItem(at: imageUrl)
                print("이미지 삭제됨.")
            } catch{
                print("이미지 삭제 못했습니다.")
            }
        }
        
        // 5. 이미지를 다큐먼트에 저장
        do{
            try data.write(to: imageUrl)
        } catch{
          print("이미지 저장 못함.")
        }
        
        
    }
    
}


extension AddViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self){
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    guard let self = self, let image = image as? UIImage else {return}
                    self.uploadImage.image = image
                }
            }
        }
    }
}
