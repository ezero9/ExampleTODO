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
    func pushViewController()
    func popViewController()
    func dismiss()
    func returnToHome()
}

class BaseNavigator: BaseNavigatorInterface {
    var topViewController: UIViewController!

    init(topViewColtroller: UIViewController) {
        self.topViewController = topViewColtroller
    }

    func pushViewController() {
        fatalError("Not Implemented! \(self)")
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
    
    func pushViewControllerFromTopViewController(_ vc: UIViewController) {
        topViewController.navigationController?.pushViewController(vc, animated: false)
        topViewController = vc
    }
    
    func presentViewControllerFromTopViewController(_ vc: UIViewController) {
        topViewController.navigationController?.present(vc, animated: true)
        topViewController = vc
    }
    
    func initializeViewController<T>(storyboardName: String, identifier: String) -> T {
        guard let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T else{
            fatalError("initialize failed: \(storyboardName) \(identifier)")
        }

        return vc
    }
}
