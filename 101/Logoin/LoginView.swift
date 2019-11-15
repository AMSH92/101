//
//  LoginView.swift
//  101
//
//  Created by Alsharif Abdullah M on 11/11/19.
//  Copyright © 2019 Alsharif Abdullah M. All rights reserved.
//

import Foundation
import UIKit
import Parse

class LoginUI: UIView {
    
    var selectedGender: Bool = false
    
    var imageView: UIImageView = {
        $0.image = #imageLiteral(resourceName: "icons8-theatre-mask-60")
        return $0
    }(UIImageView())
    
    var maleView: UIView = {
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 5
        $0.isUserInteractionEnabled = true
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "icons8-male-100")
        $0.addSubview(image)
        image.centerViewY(view: $0, constant: 0)
        image.centerViewX(view: $0)
        
        return $0
    }(UIView())
    var femaleView: UIView = {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .darkGray
        $0.isUserInteractionEnabled = true
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "icons8-female-100")
        $0.addSubview(image)
        image.centerViewY(view: $0, constant: 0)
        image.centerViewX(view: $0)
        return $0
    }(UIView())
    
    var enterButton: UIButton = {
        $0.setTitle("ENTER", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        $0.addTarget(self, action: #selector(didPressEnterButton), for: .touchUpInside)
        return $0
    }(UIButton())

    let genderView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(white: 0.95, alpha: 1)
        self.setUI()
        self.setRecognizers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setLayout()
    }
    
}

extension LoginUI {
    fileprivate func setUI() {
        addSubview(self.imageView)
        addSubview(self.enterButton)
        addSubview(genderView)

        genderView.stack(.horizontal, views: self.maleView,femaleView, spacing: 10).distribution = .fillEqually
        genderView.anchor(top: self.imageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 200))
    }
    
    fileprivate func setLayout() {
        self.imageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil , padding: .init(top: 50, left: 0, bottom: 0, right: 0) ,size: .init(width: 70, height: 70))
        self.imageView.centerViewX(view: self)
        
        self.enterButton.anchor(top: genderView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor , padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 40))
    }
    fileprivate func setRecognizers() {
        let femlaeTab = UITapGestureRecognizer(target: self, action: #selector(self.didPressFemaleButton))
        self.femaleView.addGestureRecognizer(femlaeTab)
        
        let maleTab = UITapGestureRecognizer(target: self, action: #selector(self.didPressMaleButton))
        self.maleView.addGestureRecognizer(maleTab)
        
    }
}
extension LoginUI {
    @objc func didPressFemaleButton() {
        self.selectedGender = true
        self.femaleView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.maleView.backgroundColor = .darkGray
    }
    @objc func didPressMaleButton() {
        self.selectedGender = false
        self.maleView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        self.femaleView.backgroundColor = .darkGray
    }
    
    @objc func didPressEnterButton() {
       // let feedView = FeedView().PFAnonymousUtils

        PFAnonymousUtils.logIn { (user, error) in
            if error == nil {
                if self.selectedGender == true {
                    user!.setValue("female", forKey: "Gender")
                }
                else {
                    user!.setValue("male", forKey: "Gender")
                }
               
                user?.email = "mask@m39gggask.com"
                user?.saveInBackground()
            }
        }
        print(PFUser.current())
    }
}


//import SwiftUI
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//    struct ContainerView: UIViewControllerRepresentable {
//        func makeUIViewController(context: UIViewControllerRepresentableContext<SwiftUIView_Previews.ContainerView>) -> UIViewController {
//            return LoginViewController()
//        }
//        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<SwiftUIView_Previews.ContainerView>) {
//        }
//    }
//}
