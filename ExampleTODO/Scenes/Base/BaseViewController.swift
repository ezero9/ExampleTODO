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
    var baseViewModel: BaseViewModelInterface! { get set }
    func showToast(message: String)
    func showPopup(title: String?, message: String?, buttonText: String?, buttonAction: (() -> Void)?)
    func hidePopup()
}

class BaseViewController: UIViewController {
    var baseViewModel: BaseViewModelInterface!
    
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
    func showToast(message: String) {
        let toastLabel: UILabel = UILabel(frame: CGRect(x: view.frame.size.width / 2 - 150, y: view.frame.size.height - 150, width: 300, height: 40))
        toastLabel.backgroundColor = UIColor.init(red: 50 / 255.0, green: 65 / 255.0, blue: 117 / 255.0, alpha: 1.0)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(toastLabel)
        
        toastLabel.text = message
        toastLabel.font = UIFont.boldSystemFont(ofSize: 15)
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        UIView.animate(withDuration: 3.0, animations: {
            toastLabel.alpha = 0.0
        }, completion: {
            (isBool) -> Void in
            self.dismiss(animated: true, completion: nil)
        })
    }

    func showPopup(title: String?, message: String?, buttonText: String?, buttonAction: (() -> Void)?) {
        
    }
    
    func hidePopup() {
        
    }
}
