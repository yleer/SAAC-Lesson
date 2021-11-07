//
//  CalendarViewController.swift
//  Week6
//
//  Created by Yundong Lee on 2021/11/05.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var allCountLabel: UILabel!
    let localRealm = try! Realm()
    
    var tasks: Results<UserDiary>!

    @IBOutlet weak var calaendarView: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()

        calaendarView.delegate = self
        calaendarView.dataSource = self
        
        tasks = localRealm.objects(UserDiary.self)
        
        let allCount = getAllDiaryCountFromUserDiary()
        allCountLabel.text = "총 \(allCount)임."
        
        let recent = localRealm.objects(UserDiary.self).sorted(byKeyPath: "createdDate", ascending: true).first?.diaryTitle
        
        let photos = localRealm.objects(UserDiary.self).filter("diaryContent != nil").count
    }
}


extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate  {
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyyMMdd"
//        let test = "20211103"
//
//        if formatter.date(from: test) == date {
//            return 3
//        }else{
//            return 1
//        }
        return tasks.filter("createdDate = %@", date).count
//
    }
    
    
}
