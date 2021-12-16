//
//  SceneDelegate.swift
//  Week12Xibs
//
//  Created by Yundong Lee on 2021/12/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        
        // 1. sb 방법: 컨트롤러 및 관련된 뷰를 정의할떄는 뷰컨트롤러를 직접 초기화 할 수 없기 때문에
        // instantiateViewController 를 통해 프로그래밍 방식을 초기화 인스턴스화한다.
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "vc") as! SnapDetailViewController
        
        // 2. xib 방법
//        let bundle = Bundle(for: SettingViewController.self) // swift meta type
//        let vc = SettingViewController(nibName: "SettingViewController", bundle: nil)
        
        // 3. 코드 방법
//        아래와 동일. xib 없이 만드는 거라 nib 없고 번들 nil로 하면 동일.
//        let vc = SnapDetailViewController(nibName: nil, bundle: nil) // 아래와
        let vc = SnapDetailViewController()
        
//        let vc = SnapDetailViewController()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible() // iOS 13 부터 필수
        print(#function)
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        print(#function)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print(#function)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print(#function)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print(#function)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print(#function)
    }


}

