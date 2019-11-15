//
//  File.swift
//  101
//
//  Created by Alsharif Abdullah M on 11/13/19.
//  Copyright © 2019 Alsharif Abdullah M. All rights reserved.
//

import Foundation
import UIKit

class FeedUI: UIView {
    
    private let cellID = "FeedCell"
    
    var customNavigationBar: UIView = {
        $0.layer.cornerRadius = 5
        $0.setupShadow(opacity: 0.4, radius: 3, offset: .init(width: 0, height: 0), color: .darkGray)
        $0.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return $0
    }(UIView())
    
    lazy var tableView: UITableView = {
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.register(FeedTableViewCell.self, forCellReuseIdentifier: cellID)
        $0.estimatedRowHeight = UITableView.automaticDimension
        return $0
    }(UITableView())
    
    private var feedModelView = FeedModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(white: 0.90, alpha: 1)
        self.setUIElements()
        self.setConstraints()
        
        self.feedModelView = .init(textFeed: "HEELOO FROM RIYAD HEELOO FROM RIYADHEELOO FROM RIYAD", createdAt: .init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeedUI {
    fileprivate func setUIElements() {
        addSubview(customNavigationBar)
        addSubview(tableView)
    }
    fileprivate func setConstraints() {
        self.customNavigationBar.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 20) , size: .init(width: 0, height: 80))
        self.tableView.anchor(top: self.customNavigationBar.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 0))
    }
}


extension FeedUI: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! FeedTableViewCell
        cell.feedModelView = self.feedModelView
        return cell
    }
}


