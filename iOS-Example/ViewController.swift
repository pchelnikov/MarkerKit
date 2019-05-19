//
//  ViewController.swift
//  MarkerKit
//
//  Created by Mikhail Pchelnikov on 27/12/2017.
//  Copyright © 2017 Michael Pchelnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let leftTopView = UIView()
    private let centerView = UIView()
    private let subCenterView = UIView()
    private let secondCenterView = UIView()
    private let bottomView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.white
        
        leftTopView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        centerView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        subCenterView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        secondCenterView.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        bottomView.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        view.addSubview(leftTopView)
        view.addSubview(centerView)
        view.addSubview(subCenterView)
        view.addSubview(secondCenterView)
        view.addSubview(bottomView)
    }
    
    private func setupConstraints() {

        let viewSafeArea: Any = {
            if #available(iOS 11.0, *) {
                return view.safeAreaLayoutGuide
            } else {
                return view!
            }
        }()

        leftTopView.mrk.leading(to: viewSafeArea, attribute: .leading, relation: .equal, constant: 20)
        leftTopView.mrk.top(to: viewSafeArea, attribute: .top, relation: .equal, constant: 50)
        leftTopView.mrk.width(30)
        leftTopView.mrk.height(30)
        
        centerView.mrk.center(to: view)
        centerView.mrk.width(100)
        centerView.mrk.height(100)
        
        secondCenterView.mrk.top(to: centerView, attribute: .centerY, relation: .equal, constant: 10)
        secondCenterView.mrk.leading(to: centerView, attribute: .centerX, relation: .equal, constant: 0)
        secondCenterView.mrk.width(100)
        secondCenterView.mrk.height(70)

        subCenterView.mrk.center(to: secondCenterView)
        subCenterView.mrk.width(30)
        subCenterView.mrk.height(30)

        bottomView.mrk.leading(to: viewSafeArea, attribute: .leading, relation: .equal, constant: 20)
        bottomView.mrk.trailing(to: viewSafeArea, attribute: .trailing, relation: .equal, constant: -20)
        bottomView.mrk.bottom(to: viewSafeArea, attribute: .bottom, relation: .equal, constant: -20)
        bottomView.mrk.height(30)
    }
}
