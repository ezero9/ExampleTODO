//
//  ProdApplicationContext.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import UIKit

class ProdApplicationContext: CommonApplicationContext {
    override func configure() {
        //Singletone
        registerSingleton({ return CoreDataStore()})
        
        //allPost
        register({ return CoreDataDAO(dataStore: self.resolve()) as AllPostDAOInterface })
        register({ return AllPostModel(allPostDAO: self.resolve()) as AllPostModelInterface })
        register({ return AllPostViewModel(allPostModel: self.resolve()) })
        register({ () -> AllPostViewController in
            let vc = self.initializeViewController(storyboardName: "AllPost", identifier: "AllPostViewController") as AllPostViewController
            let vm = self.resolve() as AllPostViewModel
            vm.baseViewController = vc
            vm.viewController = vc
            vc.baseViewModel = vm
            vc.allPostViewModel = vm
            return vc
        })
        //addPost
        register({ return CoreDataDAO(dataStore: self.resolve()) as AddPostDAOInterface })
        register({ return AddPostModel(addPostDAO: self.resolve()) as AddPostModelInterface })
        register({ return AddPostViewModel(addPostModel: self.resolve()) })
        register({ () -> AddPostViewController in
            let vc = self.initializeViewController(storyboardName: "AddPost", identifier: "AddPostViewController") as AddPostViewController
            let vm = self.resolve() as AddPostViewModel
            vm.baseViewController = vc
            vm.viewController = vc
            vc.baseViewModel = vm
            vc.addPostViewModel = vm
            return vc
        })
        
        //detailPost
    }
    
    private func initializeViewController<T>(storyboardName: String, identifier: String) -> T {
        guard let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T else{
            fatalError("initialize failed: \(storyboardName) \(identifier)")
        }
        
        return vc
    }
}
