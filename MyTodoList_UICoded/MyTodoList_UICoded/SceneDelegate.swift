//
//  SceneDelegate.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // 앱이 실행될 때 새로운 사용자환경(scene)과 연결될 때 호출됩니다.
    // 여기서는 UIScene이 연결될 때 실행되는 초기설정을 담당합니다.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // 매개변수 scene을 UIWindowScene으로 캐스팅합니다.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // UIWindow생성. UIWindow의 인스턴스를 생성하고, 사용자에게 보여지는 기본창인 window를 windowScene과 연결합니다.
        window = UIWindow(windowScene: windowScene)
        
        // rootViewController 설정. TodoViewController의 인스턴스를 생성하고, 이를 기반으로 UINavigationController를 만듭니다.
        // UINavigationController는 뷰컨트롤러들을 스택(Stack)으로 관리하며, TodoController를 최상위(root)뷰컨트롤러로 설정합니다.
        let vc = TodoViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        // UIWindow의 rootViewController설정. 직전의 UINavigationController를 window의 최상위(root) 뷰컨트롤러로 설정합니다.
        // 따라서 앱이 실행되면 보여지는 초기화면은 TodoViewController가 내장된 NavigationController입니다.
        window?.rootViewController = nav
        
        // UIWindow표시. window를 키 윈도우로 설정하고 화면에 표시합니다. 앱의 창을 사용자에게 보이게하는 마지막 단계.
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

