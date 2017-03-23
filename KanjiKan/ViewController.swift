//
//  ViewController.swift
//  KanjiKan
//
//  Created by Sikhapol Saijit on 12/27/16.
//  Copyright © 2016 Kanji Kan. All rights reserved.
//

import UIKit

import KanjiKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = KanjiKit.init().text
    }
}

