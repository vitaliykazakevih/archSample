//
//  SceneDelegate.swift
//  TestArchitecture
//
//  Created by Kazakevich, Vitaly on 18.06.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private var mainRouter: Router?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let startRouter = StartPageRouter(container: DependencyContainer.shared,
                                     parameters: .init(userName: "Nicola")) // name is passed only as example

        startRouter.show { window?.rootViewController = $0 }
        window?.makeKeyAndVisible()
        mainRouter = startRouter
    }
}

