//
//  TestApplicationContext.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation

class TestApplicationContext: CommonApplicationContext {
    override func configure() {
        //Singleton
        registerSingleton({ return TestDataStore()})
        
        //allPost
        register({ return TestDataDAO(dataStore: self.resolve()) as AllPostDAOInterface })
        register({ return AllPostModel(allPostDAO: self.resolve()) as AllPostModelInterface })
        register({ return AllPostViewModel(allPostModel: self.resolve()) })
        
        //addPost
        register({ return TestDataDAO(dataStore: self.resolve()) as AddPostDAOInterface })
        register({ return AddPostModel(addPostDAO: self.resolve()) as AddPostModelInterface })
        register({ return AddPostViewModel(addPostModel: self.resolve()) })
        
        //detailPost
    }
}
