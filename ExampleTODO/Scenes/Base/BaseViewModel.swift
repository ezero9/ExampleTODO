//
//  BaseViewModel.swift
//  ExampleTODO
//
//  Created by LYJ on 28/05/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation

protocol BaseViewModelInterface {
    
}

class BaseViewModel {
    var baseNavigator: BaseNavigator!
    var baseViewController: BaseViewInterface!
}
