//
//  AddPostNavigator.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import UIKit

protocol AddPostNavigatorInterface {
    
}

class AddPostNavigator: AddPostNavigatorInterface {
    private let topViewController: UIViewController!
    
    init(topViewColtroller: UIViewController) {
        self.topViewController = topViewColtroller
    }
    
    
    func toAddpost() {
        let storyBoard = UIStoryboard(name: "AddPost", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddPostViewController") as! AddPostViewController
        //        vc.allPostViewModel.navigator = self
        topViewController.navigationController?.pushViewController(vc, animated: false)
    }
    
    func toEditPost() {
        
    }
}
