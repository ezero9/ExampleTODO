//
//  AllPostViewController.swift
//  ExampleTODO
//
//  Created by YoungJu Lee on 16/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AllPostViewController: UIViewController {
    @IBOutlet weak var addPostButton: UIBarButtonItem!
    @IBOutlet weak var postTableView: UITableView!
    
    let allPostViewModel: AllPostViewModel = ApplicationContext.resolve()
    //let allPostViewModel: AllPostViewModel =  ApplicationContext.getObject(key: "allPostViewModel")
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let output = allPostViewModel.transform(input: AllPostViewModel.Input(addPostTrigger: addPostButton.rx.tap.asDriver()))
        
        output.allPost.asObservable().bind(to: self.postTableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) {
            (index, data, cell) in
            cell.textLabel?.text = data.title
        }.disposed(by: disposeBag)
        
        output.addPost.drive().disposed(by: disposeBag)
    }
}
