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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad", self)
        baseViewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear", self)
        baseViewModel.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear", self)
        baseViewModel.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear", self)
        baseViewModel.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear", self)
        baseViewModel.viewDidDisappear(animated)
    }
}

extension BaseViewController: BaseViewInterface {
    func showPopup() {
        
    }
    
    func hidePopup() {
        
    }
}
