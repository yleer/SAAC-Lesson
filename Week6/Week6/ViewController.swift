//
//  ViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var backupRestoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = LocalizableStrings.welcome_text.localized
        welcomeLabel.font = UIFont().main
        backupRestoreLabel.text = LocalizableStrings.data_restore.localizedSetting
        
        tabBarLocalization()
    }
    
    func tabBarLocalization(){
        tabBarController?.tabBar.items?[1].title = LocalizableStrings.search_tab_bar_title.localized
        tabBarController?.tabBar.items?[2].title = LocalizableStrings.setting_tab_bar_title.localized
        tabBarController?.tabBar.items?[3].title = LocalizableStrings.calender_tab_bar_title.localized
    }

    

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else{return}
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

