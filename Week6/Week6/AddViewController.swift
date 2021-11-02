//
//  AddViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/01.
//

import UIKit
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
        }
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
