//
//  BaseNavigator.swift
//  ExampleTODO
//
//  Created by LYJ on 28/05/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import UIKit

protocol BaseNavigatorInterface {
    func pushViewController(from: UIViewController)
    func presentViewController(from: UIViewController)
    func popViewController()
    func dismiss()
    func returnToHome()
}

class BaseNavigator<T: BaseViewController>: BaseNavigatorInterface {
    var topViewController: UIViewController!

    func pushViewController(from: UIViewController) {
        let vc: T = ApplicationContext.resolve()
        vc.baseViewModel.baseNavigator = self
        from.navigationController?.pushViewController(vc, animated: false)
        topViewController = vc
    }
    
    func presentViewController(from: UIViewController) {
        let vc: T = ApplicationContext.resolve()
        vc.baseViewModel.baseNavigator = self
        from.present(vc, animated: true)
        topViewController = vc
    }
    
    func popViewController() {
        mainThread {
            self.topViewController.navigationController?.popViewController(animated: true)
        }
    }

    func dismiss() {
        mainThread {
            self.topViewController.dismiss(animated: true)
        }
    }

    func returnToHome() {

    }

    func initializeViewController<T>(storyboardName: String, identifier: String) -> T {
        guard let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T else{
            fatalError("initialize failed: \(storyboardName) \(identifier)")
        }

        return vc
    }
}
