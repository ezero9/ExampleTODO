//
//  AllPost.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import RxSwift

protocol AllPostModelInterface {
    func getAllPost() -> Variable<[Post]>
}

class AllPostModel: AllPostModelInterface {
    private let allPostDAO: AllPostDAOInterface! //= ApplicationContext.getObject(key: "allPostDAO")

    init(allPostDAO: AllPostDAOInterface) {
        self.allPostDAO = allPostDAO
    }

    func getAllPost() -> Variable<[Post]> {
        return allPostDAO.getAllPost()
    }
}

protocol AllPostDAOInterface {
    func getAllPost() -> Variable<[Post]>
}
