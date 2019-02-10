//
//  AllPostNavigator.swift
//  ExampleTODO
//
//  Created by YoungJu Lee on 16/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import UIKit

protocol AllPostNavigatorInterface {
    func toAllPost()
    func toAddPost()
    func toEditPost()
}

class AllPostNavigator: AllPostNavigatorInterface {
    private let topViewController: UIViewController!

    init(topViewColtroller: UIViewController) {
        self.topViewController = topViewColtroller
    }

    func toAllPost() {
        let storyBoard = UIStoryboard(name: "AllPost", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AllPostViewController") as! AllPostViewController
        vc.allPostViewModel.navigator = self
        topViewController.navigationController?.pushViewController(vc, animated: false)
    }

    func toAddPost() {
        let storyBoard = UIStoryboard(name: "AddPost", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddPostViewController") as! AddPostViewController
        vc.addPostViewModel.navigator = AddPostNavigator(topViewColtroller: topViewController)
        topViewController.present(vc, animated: true, completion: nil)
    }
    
    func toEditPost() {
        
    }
}
