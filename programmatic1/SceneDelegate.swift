//
//  SceneDelegate.swift
//  programmatic1
//
//  Created by Mustafa Fatih on 5/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowSceneA = (scene as? UIWindowScene) else { return }  // Ilk basta gordugun gibi guard let _ seklinde olan bu satirda variable ismi yok.scene 'i kullanabilmek icin buna bir isim veriyoruz.
        window = UIWindow(frame: windowSceneA.coordinateSpace.bounds)            //Simdi window'u initialize edecegiz. frame vererek initialize ediyoruz. Bu arada buradaki window ustte bize sceneDelegate'da default olarak verilen window.
        window?.windowScene = windowSceneA
        window?.rootViewController = CardSelectionVC()    //Bu bizim ilk initial viewControllerimizi olacak. Tabi bundan once sildigimiz viewControelerin yerine yeni bir tane olsutrumamiz gerekiyor. Olusturduktan sonra onu root yani kok ana viewController yapiyoruz.
        window?.makeKeyAndVisible() // Bu da gorunur kilmak icin
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
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

