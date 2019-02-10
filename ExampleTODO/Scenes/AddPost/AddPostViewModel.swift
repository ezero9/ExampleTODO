//
//  AddPostViewModel.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AddPostViewModel: ViewModel {
    private let addPostModel: AddPostModelInterface //= ApplicationContext.getObject(key: "addPostModel")
    var navigator: AddPostNavigatorInterface?
    
    init(addPostModel: AddPostModelInterface) {
        self.addPostModel = addPostModel
    }
    
    func transform(input: AddPostViewModel.Input) -> AddPostViewModel.Output {
        let values = Driver.combineLatest(input.title, input.contents) { ($0, $1) }
        let enableSave = Driver.combineLatest(input.title, input.contents) { !$0.isEmpty && !$1.isEmpty }
        let save = input.saveBtn.withLatestFrom(values).map { (title, contents) -> Post in
                return Post(id: 11, title: title, contents: contents)
            }.flatMapLatest { post -> SharedSequence<DriverSharingStrategy, ()> in
                self.addPostModel.addPost(post)
                return Driver.just(())
            }
        
        let dismiss = Driver
            .of(input.cancelBtn, save)
            .merge()
        
        return Output(dismiss: dismiss, saveBtnEnable: enableSave)
    }
}

extension AddPostViewModel {
    struct Input {
        let title: Driver<String>
        let contents: Driver<String>
        let saveBtn: Driver<Void>
        let cancelBtn: Driver<Void>
    }
    struct Output {
        let dismiss: Driver<Void>
        let saveBtnEnable: Driver<Bool>
    }
}


