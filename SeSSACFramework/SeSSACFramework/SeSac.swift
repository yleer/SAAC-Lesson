//
//  SeSac.swift
//  SeSSACFramework
//
//  Created by Yundong Lee on 2021/12/23.
//

import UIKit
import WebKit

open class SesSACOpen: UIViewController {
    var openName: String = "go"
    
    // open은 오버라이딩 가능
    open func openFunc() {
        print("aa")
    }
    
    public enum TransitionStyle {
        case present, push
    }
    
    // public은 오버라이딩 불가능
    public func presentWebViewController(url: String, transitionStyle: TransitionStyle, vc: UIViewController) {
        let webviewController = WebViewController()
        webviewController.url = url
            
        switch transitionStyle {
        case .present:
            vc.present(webviewController, animated: true, completion: nil)
        case.push:
            vc.navigationController?.pushViewController(webviewController, animated: true)
            
        }
}

class WebViewController: UIViewController, WKUIDelegate {
    
    var url: String = "https://www.apple.com"
    var webView: WKWebView!
        
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
}



public class SeSACPublic: UIViewController {
    public var publicName: String = "go"
}

internal class SeSACInternal: UIViewController {
    var internalName: String = "go"
}

fileprivate class SeSACFilePrivate: UIViewController {
    var filePrivateName: String = "go"
}

private class SeSACPrivate: UIViewController {
    var privateName: String = "go"
}
