//
//  AppDelegate.swift
//  RadarCOVIDStats
//
//  Original idea by Pedro José Pereira Vieito
//  Created by Jorge J. Ramos on 23/09/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let launchCoordinator = <~LaunchCoordinator.self

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return launchCoordinator.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
