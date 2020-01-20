//
//  WindowHelper.swift
//  testeFleuryTests
//
//  Created by Tatiana Rico on 19/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit
class WindowHelper: NSObject {
        
        static var testWindow: UIWindow = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            return window
        }()
        
        static func showInTestWindow(viewController: UIViewController) {
            WindowHelper.testWindow.rootViewController = viewController
            WindowHelper.testWindow.makeKeyAndVisible()
        }
        
        static func cleanTestWindow() {
            WindowHelper.testWindow.rootViewController = nil
            WindowHelper.testWindow.isHidden = true
        }
    }

