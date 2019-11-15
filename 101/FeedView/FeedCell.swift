//
//  FeedCell.swift
//  101
//
//  Created by Alsharif Abdullah M on 11/13/19.
//  Copyright © 2019 Alsharif Abdullah M. All rights reserved.
//

import Foundation
import UIKit

class FeedTableViewCell: UITableViewCell {

    var backgroundTextView: UIView = {
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    var feedLabel: UILabel = {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    var createdAtLabel: UILabel = {
        $0.font = .systemFont(ofSize: 16, weight: .light)
        return $0
    }(UILabel())
    
    var feedModelView: FeedModel!  {
        didSet {
            self.feedLabel.text = feedModelView.textFeed
            //self.createdAtLabel.text = feedModelView.createdAt.DateToString()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        self.setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FeedTableViewCell {
    fileprivate func setUI() {
        addSubview(self.backgroundTextView)
        self.backgroundTextView.addSubview(self.feedLabel)
        self.setCons()
    }
    fileprivate func setCons() {
        self.backgroundTextView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor , padding: .init(top: 10, left: 20, bottom: 10, right: 20))
        self.feedLabel.anchor(top: self.backgroundTextView.topAnchor, leading: self.backgroundTextView.leadingAnchor, bottom: self.backgroundTextView.bottomAnchor, trailing: self.backgroundTextView.trailingAnchor, padding: .init(top: 20, left: 10, bottom: 20, right: 0))
    }
}



import SwiftUI
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<SwiftUIView_Previews.ContainerView>) -> UIViewController {
            return FeedViewController()
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<SwiftUIView_Previews.ContainerView>) {
        }
    }
}
