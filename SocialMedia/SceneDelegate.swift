//
//  SceneDelegate.swift
//  SocialMedia
//
//  Created by Danis Bagautdinov on 25.02.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = createTabBarController()
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
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

    //Creating Tab Bar
    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        
        //Profile Navigation
        let ProfileNC = createNavigationController(
            rootViewController: ProfileViewController(),
            title: "Profile",
            image: UIImage(systemName: "person.circle")
        )
        
        //Friens Navigation
        let FriendsNC = createNavigationController(
            rootViewController: FriendsViewController(),
            title: "Friends",
            image: UIImage(systemName: "person.crop.circle")?.withTintColor(.systemBlue)
        )
        
        //Gallery Navigation
        let GalleryNC = createNavigationController(
            rootViewController: GalleryViewController(),
            title: "Gallery",
            image: UIImage(systemName: "photo.circle")
        )
        
        //Settings Navigation
        let SettingsNC = createNavigationController(
            rootViewController: SettingsViewController(),
            title: "Settings",
            image: UIImage(systemName: "gearshape")
        )
        
        tabBarController.viewControllers = [ProfileNC, FriendsNC, GalleryNC, SettingsNC]
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.unselectedItemTintColor = .systemGray
        return tabBarController
    }
    
    //Creating Navigation Controllers
    private func createNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}

