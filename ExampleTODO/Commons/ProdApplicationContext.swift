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
        registerSingleton({ return CoreDataStore() })
        registerSingleton({ return EventService() })
        
        //allPost
        register({ return CoreDataDAO(dataStore: self.resolve()) as AllPostDAOInterface })
        register({ return AllPostModel(allPostDAO: self.resolve()) as AllPostModelInterface })
        register({ return AllPostViewModel(allPostModel: self.resolve()) })
        register({ () -> AllPostViewController in
            let result: (AllPostViewController, AllPostViewModel) = self.initializeViewControllerAndViewModel(storyboardName: "AllPost", identifier: "AllPostViewController")
            return result.0
        })
        //addPost
        register({ return CoreDataDAO(dataStore: self.resolve()) as AddPostDAOInterface })
        register({ return AddPostModel(addPostDAO: self.resolve()) as AddPostModelInterface })
        register({ return AddPostViewModel(addPostModel: self.resolve()) })
        register({ () -> AddPostViewController in
            let result: (AddPostViewController, AddPostViewModel) = self.initializeViewControllerAndViewModel(storyboardName: "AddPost", identifier: "AddPostViewController")
            return result.0
        })
        
        //detailPost
    }

    private func initializeViewControllerAndViewModel<T1: BaseViewInterface, T2: BaseViewModelInterface>(storyboardName: String, identifier: String) -> (T1, T2) {
        var vc: T1 = initializeViewController(storyboardName: storyboardName, identifier: identifier)
        var vm: T2 = self.resolve()
        vm.baseViewController = vc
        vc.baseViewModel = vm

        return (vc, vm)
    }

    private func initializeViewController<T>(storyboardName: String, identifier: String) -> T {
        guard let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T else{
            fatalError("initialize failed: \(storyboardName) \(identifier)")
        }
        
        return vc
    }
}
