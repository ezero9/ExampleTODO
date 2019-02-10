//
//  ProdApplicationContext.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation

class ProdApplicationContext: CommonApplicationContext {
    override func configure() {
        //Singletone
        registerSingleton({ return CoreDataStore()})

        //allPost
        register({ return CoreDataDAO(dataStore: self.resolve()) as AllPostDAOInterface })
        register({ return AllPostModel(allPostDAO: self.resolve()) as AllPostModelInterface })
        register({ return AllPostViewModel(allPostModel: self.resolve()) })
        
        //addPost
        register({ return CoreDataDAO(dataStore: self.resolve()) as AddPostDAOInterface })
        register({ return AddPostModel(addPostDAO: self.resolve()) as AddPostModelInterface })
        register({ return AddPostViewModel(addPostModel: self.resolve()) })
        
        //detailPost
    }
}
