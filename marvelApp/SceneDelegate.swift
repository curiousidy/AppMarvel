//
//  SceneDelegate.swift
//  marvelApp
//
//  Created by idaira aleman quintana on 16/3/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Creamos la ventana principal de la aplicacion.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        // Creamos el controlador inicial y lo asociamos al atributo 'rootViewController' de la ventana.
        let controller = MainTabBarViewController(nibName: "MainTabBarViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigationController
        
        
        // Asociamos la ventana al SceneDelegate, la declaramos como ventana principal y hacemos visible.
        self.window = window
        window.makeKeyAndVisible()
    }}

