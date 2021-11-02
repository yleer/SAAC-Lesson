//
//  VisionViewController.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/27.
//

import UIKit
import JGProgressHUD

class VisionViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var uploadImage: UIImageView!
    
    let progress = JGProgressHUD()
    let imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
    }
    

    @IBAction func clickToSearch(_ sender: UIButton) {
        progress.show(in: view, animated: true)
        VisionApiManager.shared.fetchData(image: uploadImage.image!) { code, json in
            print(code)
            print(json)
            self.progress.dismiss(animated: true)
        }
    }
    
    @IBAction func photoButtonClicked(_ sender: UIButton) {
        self.present(imagePicker, animated: true, completion: nil)
    }
}


extension VisionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let value = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            uploadImage.image = value
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canced")
    }
    
    
    
}
