//
//  BaseViewController.swift
//  ExampleTODO
//
//  Created by LYJ on 28/05/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewInterface {
    func showPopup()
    func hidePopup()
}

class BaseViewController: UIViewController {
    var baseViewModel: BaseViewModel!
}
