//
//  FeedViewController.swift
//  101
//
//  Created by Alsharif Abdullah M on 11/13/19.
//  Copyright © 2019 Alsharif Abdullah M. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let ui = FeedUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        self.view = self.ui
    }
}

