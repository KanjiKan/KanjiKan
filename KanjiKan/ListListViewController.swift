//
//  ListListViewController.swift
//  KanjiKan
//
//  Created by Sikhapol Saijit on 12/27/16.
//  Copyright © 2016 Kanji Kan. All rights reserved.
//

import UIKit

import KanjiKit

import RxSwift
import RxCocoa

class ListListViewController: UITableViewController {
    let lists = Variable([List]())
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lists.asObservable().bindTo(tableView.rx.items(cellIdentifier: "Cell")) { row, list, cell in
            cell.textLabel?.text = list.title
        }
        .addDisposableTo(disposeBag)
        
        tableView.rx.modelSelected(List.self).subscribe(onNext: { list in
            let viewController = KanjiListViewController()
            viewController.kanjis = list.items
            self.show(viewController, sender: nil)
        }).addDisposableTo(disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let list = List.jlptLists() {
                self.lists.value = list
            }
        }
    }
}

