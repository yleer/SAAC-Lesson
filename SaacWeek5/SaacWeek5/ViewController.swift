//
//  ViewController.swift
//  SaacWeek5
//
//  Created by Yundong Lee on 2021/10/25.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import MapKit
import Kingfisher
class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidtyLabel: UILabel!
    @IBOutlet weak var currentWindSpeedLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    @IBAction func reloadButton(_ sender: UIButton) {
        
        if CLLocationManager.locationServicesEnabled(){
            let authStatus : CLAuthorizationStatus
            if #available(iOS 14.0, *){
                authStatus = locationManager.authorizationStatus // IOS 14이상 가능
            }else{
                authStatus = CLLocationManager.authorizationStatus() // IOS 14이상 미만
            }
            switch authStatus {
            
            case .restricted, .denied:
                print("설정 페이지로 유도")
                let alertVC = UIAlertController(title: "위치 권한이 거부되었습니다.", message: "정확한 서비스를 위하여 위치 권한을 허용해주세요.", preferredStyle: .alert)
                
                let goToSetting = UIAlertAction(title: "설정으로", style: .default) { _ in
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                            return
                        }

                        if UIApplication.shared.canOpenURL(settingsUrl) {
                            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                print("Settings opened: \(success)")
                            })
                        }
                }
                let cancelAction = UIAlertAction(title: "취소", style: .cancel)
                alertVC.addAction(cancelAction)
                alertVC.addAction(goToSetting)
                self.present(alertVC, animated: true, completion: nil)
            default:
                print("권한 이미 설정되어 있음.")
                
            }
        }else{
            print("위치 권한 확인좀 해주세요.")
        }
    }
}


extension ViewController: CLLocationManagerDelegate{
    
    // When current location gets updated.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate{
            let clLoc = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            getCurrentAddress(location: clLoc)
            
            WeatherApiManager.shared.getData(lat: coordinate.latitude, lon: coordinate.longitude) { code, json in
                let currentTemperature = json["main"]["temp"].doubleValue - 273.15
                let currentHumid = json["main"]["humidity"].intValue
                let currentWindSpeed = json["wind"]["speed"].doubleValue
                self.currentTemperatureLabel.text = "\(Int(currentTemperature))"
                self.currentHumidtyLabel.text = "\(String(describing: currentHumid))"
                self.currentWindSpeedLabel.text = "\(Int(currentWindSpeed))"

                let url = URL(string: "https://openweathermap.org/img/wn/\(json["weather"][0]["icon"].stringValue)@2x.png")
                self.iconImage.kf.setImage(with: url)
            }
        }else{
            print("not getting locations")
        }
    }
    
    func getCurrentAddress(location : CLLocation) {
        let geoCoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        geoCoder.reverseGeocodeLocation(location, preferredLocale: locale) { placMarker, error in
            guard error == nil, let place = placMarker?.first else{
                print("불가능")
                return
            }
            if let administrativeArea = place.administrativeArea, let loca = place.locality{
                self.currentLocationLabel.text = administrativeArea + "  " + loca
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error : getting location from user.")
    }
    

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkCLAuthStatus()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        checkCLAuthStatus()
    }
    
    func checkCLAuthStatus() {
        let authStatus : CLAuthorizationStatus
        if #available(iOS 14.0, *){
            authStatus = locationManager.authorizationStatus // IOS 14이상 가능
        }else{
            authStatus = CLLocationManager.authorizationStatus() // IOS 14이상 미만
        }
        
        if CLLocationManager.locationServicesEnabled(){
            checkCurrentLocationAuth(authStatus)
        }else{
            print("Location service blocked. Go to setting and enable it.")
        }
    }
    
    func checkCurrentLocationAuth(_ status : CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.requestWhenInUseAuthorization()
            print("not determined")
        case .restricted, .denied:
            print("denied , 설정으로 유도")
            let alertVC = UIAlertController(title: "위치 권한이 거부되었습니다.", message: "정확한 서비스를 위하여 위치 권한을 허용해주세요.", preferredStyle: .alert)
            
            let goToSetting = UIAlertAction(title: "설정으로", style: .default) { _ in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }

                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)")
                        })
                    }
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            alertVC.addAction(cancelAction)
            alertVC.addAction(goToSetting)
            self.present(alertVC, animated: true, completion: nil)
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            print("always")
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            print("default")
        }
    }
    
}
