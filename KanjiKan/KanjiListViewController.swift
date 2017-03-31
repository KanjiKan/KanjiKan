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

class KanjiListViewController: UICollectionViewController {
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
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        guard let collectionView = collectionView else { fatalError() }
        
        collectionView.register(UINib(nibName: "KanjiCell", bundle: nil) , forCellWithReuseIdentifier: "KanjiCell")
        
        _kanjis.asObservable()
            .bindTo(collectionView.rx.items(cellIdentifier: "KanjiCell", cellType: KanjiCell.self)) { index, kanji, cell in
                cell.kanjiLabel.text = kanji.description
            }
            .addDisposableTo(disposeBag)
    }
}
