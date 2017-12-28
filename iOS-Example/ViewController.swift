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
    private let rightBottomView = UIView()
    private let centerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.white
        
        leftTopView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        rightBottomView.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        centerView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        
        view.addSubview(leftTopView)
        view.addSubview(rightBottomView)
        view.addSubview(centerView)
    }
    
    private func setupConstraints() {
        leftTopView.mrk.leading(to: view, attribute: .leading, relation: .equal, constant: 20)
        leftTopView.mrk.top(to: view, attribute: .top, relation: .equal, constant: 50)
        leftTopView.mrk.width(30)
        leftTopView.mrk.height(30)
        
        rightBottomView.mrk.leading(to: view, attribute: .leading, relation: .equal, constant: 20)
        rightBottomView.mrk.trailing(to: view, attribute: .trailing, relation: .equal, constant: -20)
        rightBottomView.mrk.bottom(to: view, attribute: .bottom, relation: .equal, constant: -20)
        rightBottomView.mrk.height(30)
        
        centerView.mrk.centerX(to: view)
        centerView.mrk.centerY(to: view)
        centerView.mrk.width(100)
        centerView.mrk.height(100)
    }
}

