//
//  CoreDataDAO.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import RxSwift

class CoreDataStore {
    fileprivate let data = Variable<[Post]>([])
    init() {
        for i in 1..<10 { //add default value 
            data.value.append(Post(id: i, title: "CoreData Title\(i)", contents: "contents\(i)"))
        }
    }
}

class CoreDataDAO {
    let dataStore: CoreDataStore! //= ApplicationContext.getObject(key: "dataStore")
    
    init(dataStore: CoreDataStore) {
        self.dataStore = dataStore
    }
}

extension CoreDataDAO: AllPostDAOInterface {
    func getAllPost() -> Variable<[Post]> {
        return dataStore.data
    }
}

extension CoreDataDAO: AddPostDAOInterface {
    func addPost(_ post: Post) {
        dataStore.data.value.append(post)
    }
}

