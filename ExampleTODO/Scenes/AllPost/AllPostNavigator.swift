//
//  AllPostNavigator.swift
//  ExampleTODO
//
//  Created by YoungJu Lee on 16/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import UIKit

protocol AllPostNavigatorInterface: BaseNavigatorInterface {
    func toAddPost()
    func toEditPost()
    func toDetailPost()
}

class AllPostNavigator: BaseNavigator {
    override func pushViewController() {
        let vc = initializeViewController(storyboardName: "AllPost", identifier: "AllPostViewController") as AllPostViewController
        vc.allPostViewModel.navigator = self
        pushViewControllerFromTopViewController(vc)
    }
}

extension AllPostNavigator: AllPostNavigatorInterface {
    func toAddPost() {
        AddPostNavigator(topViewColtroller: topViewController).pushViewController()
    }

    func toEditPost() {
        //EditPostNavigator(topViewController: topViewController).toEditPost()
    }

    func toDetailPost() {
        //DetailPostNavigator(topViewController: topViewController).toDetailPost()
    }
}
