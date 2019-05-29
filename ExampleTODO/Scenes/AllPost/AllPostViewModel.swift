//
//  AllPostViewModel.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AllPostViewModel: BaseViewModel {
    var viewController: AllPostViewInterface!
    private var navigator: AllPostNavigatorInterface!
    private let allPostModel: AllPostModelInterface //= ApplicationContext.getObject(key: "allPostModel")
    
    init(allPostModel: AllPostModelInterface) {
        self.allPostModel = allPostModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigator = baseNavigator as? AllPostNavigatorInterface
    }
    
}

extension AllPostViewModel: ViewModel {
    func transform(input: AllPostViewModel.Input) -> AllPostViewModel.Output {
        let addPost = input.addPostTrigger.do(onNext: { self.navigator?.toAddPost() })
        let output = Output(allPost: allPostModel.getAllPost(),
                            addPost: addPost)
        
        return output
    }
}

extension AllPostViewModel {
    struct Input {
        let addPostTrigger: Driver<Void>
    }
    struct Output{
        let allPost: Variable<[Post]>
        let addPost: Driver<Void>
    }
}


