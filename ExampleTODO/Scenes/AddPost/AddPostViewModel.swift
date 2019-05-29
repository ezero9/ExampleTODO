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

class AddPostViewModel: BaseViewModel {
    var viewController: AddPostViewInterface!
    private let addPostModel: AddPostModelInterface //= ApplicationContext.getObject(key: "addPostModel")
    private var navigator: AddPostNavigatorInterface?
    private let disposeBag = DisposeBag()
    
    init(addPostModel: AddPostModelInterface) {
        self.addPostModel = addPostModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigator = baseNavigator as? AddPostNavigatorInterface
    }
}

extension AddPostViewModel: ViewModel {
    func transform(input: AddPostViewModel.Input) -> AddPostViewModel.Output {
        let values = Driver.combineLatest(input.title, input.contents) { ($0, $1) }
        let enableSave = Driver.combineLatest(input.title, input.contents) { !$0.isEmpty && !$1.isEmpty }
        let save = input.saveBtn.withLatestFrom(values).map { (title, contents) -> Post in
            return Post(id: 11, title: title, contents: contents)
            }.flatMapLatest { post -> SharedSequence<DriverSharingStrategy, ()> in
                self.addPostModel.addPost(post)
                return Driver.just(())
        }
        
        Driver
            .of(input.cancelBtn, save)
            .merge()
            .drive(onNext: { [weak self] _ in self?.navigator?.dismiss() })
            .disposed(by: disposeBag)
        
        return Output(saveBtnEnable: enableSave)
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
        let saveBtnEnable: Driver<Bool>
    }
}


