//
//  UILabel.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by Abdullah Alsharif on 4/26/19.
//  Copyright © 2019 Abdullah Alsharif. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String?, font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
