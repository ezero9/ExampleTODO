//
//  TestDataDAO.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import RxSwift

class TestDataStore {
    fileprivate let data = Variable<[Post]>([])
    init() {
        for i in 1..<5 { //add default value
            data.value.append(Post(id: i, title: "TestData Title\(i)", contents: "contents\(i)"))
        }
    }
}

class TestDataDAO {
    let dataStore: TestDataStore! //= ApplicationContext.getObject(key: "dataStore")
    
    init(dataStore: TestDataStore) {
        self.dataStore = dataStore
    }
}

extension TestDataDAO: AllPostDAOInterface {
    func getAllPost() -> Variable<[Post]> {
        return dataStore.data
    }
}

extension TestDataDAO: AddPostDAOInterface {
    func addPost(_ post: Post) {
        dataStore.data.value.append(post)
    }
}
