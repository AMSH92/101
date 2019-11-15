//
//  LoginViewController.swift
//  101
//
//  Created by Alsharif Abdullah M on 11/11/19.
//  Copyright © 2019 Alsharif Abdullah M. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let ui = LoginUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = ui
    }

}
