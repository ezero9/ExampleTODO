//
//  AddPostViewController.swift
//  ExampleTODO
//
//  Created by LYJ on 17/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddPostViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextField: UITextView!
    
    private let disposeBag = DisposeBag()
    
    let addPostViewModel: AddPostViewModel = ApplicationContext.resolve() //ApplicationContext.getObject(key: "addPostViewModel")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentsTextField.layer.borderColor = UIColor.gray.cgColor
        self.contentsTextField.layer.borderWidth = 2.3
        self.contentsTextField.layer.cornerRadius = 15
        
        let ouput = addPostViewModel.transform(input: AddPostViewModel.Input(title: titleTextField.rx.text.orEmpty.asDriver(),
                                                                      contents: contentsTextField.rx.text.orEmpty.asDriver(),
                                                                      saveBtn: saveButton.rx.tap.asDriver(),
                                                                      cancelBtn: cancelButton.rx.tap.asDriver()))
        
        
        
//        ouput.dismiss.drive(onNext: { self.dismiss(animated: true) }).disposed(by: disposeBag)
        ouput.saveBtnEnable.drive(saveButton.rx.isEnabled).disposed(by: disposeBag)
    }
}
