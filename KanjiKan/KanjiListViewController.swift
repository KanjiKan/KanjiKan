//
//  KanjiListViewController.swift
//  KanjiKan
//
//  Created by ST20966 on 2017/03/29.
//  Copyright © 2017年 Kanji Kan. All rights reserved.
//

import UIKit

import KanjiKit

import RxSwift
import RxCocoa

class KanjiListViewController: UITableViewController {
    private var _kanjis = Variable([Kanji]())
    
    var kanjis: [Kanji] {
        get {
            return _kanjis.value
        }
        set {
            _kanjis.value = newValue
        }
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        _kanjis.asObservable().bindTo(tableView.rx.items(cellIdentifier: "Cell")) { row, kanji, cell in
            cell.textLabel?.text = String(describing: kanji)
        }
        .addDisposableTo(disposeBag)
    }
}
