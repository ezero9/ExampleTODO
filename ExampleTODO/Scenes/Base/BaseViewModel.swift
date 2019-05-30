//
//  BaseViewModel.swift
//  ExampleTODO
//
//  Created by LYJ on 28/05/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation

protocol BaseViewModelInterface {
    var baseNavigator: BaseNavigatorInterface! { get set }
    var baseViewController: BaseViewInterface! { get set }
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

class BaseViewModel {
    var baseNavigator: BaseNavigatorInterface!
    var baseViewController: BaseViewInterface!
    let eventService = ApplicationContext.resolve() as EventService

    func viewDidLoad() {
        eventService.addEventListener(self)
    }
    
    func viewWillAppear(_ animated: Bool) {

    }
    
    func viewDidAppear(_ animated: Bool) {
        
    }
    
    func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func viewDidDisappear(_ animated: Bool) {

    }
}

extension BaseViewModel: EventServiceListener {
    func onEvent(event: EventService.EventType) {
        switch event {
        case .netwrokConnect:
            baseViewController.showToast(message: "networkConnect!")
        case .netwrokDisConnect:
            baseViewController.showToast(message: "networkDisConnect!")
        }
    }
}
