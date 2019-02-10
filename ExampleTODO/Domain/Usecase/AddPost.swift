//
//  AddPost.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import RxSwift

protocol AddPostModelInterface {
    func addPost(_ post: Post)
}

class AddPostModel: AddPostModelInterface {
    private let addPostDAO: AddPostDAOInterface //= ApplicationContext.getObject(key: "addPostDAO")

    init(addPostDAO: AddPostDAOInterface) {
        self.addPostDAO = addPostDAO
    }

    func addPost(_ post: Post) {
        addPostDAO.addPost(post)
    }
}

protocol AddPostDAOInterface {
    func addPost(_ post: Post)
}
