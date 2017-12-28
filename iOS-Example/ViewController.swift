//
//  ViewController.swift
//  MarkerKit
//
//  Created by Mikhail Pchelnikov on 27/12/2017.
//  Copyright © 2017 Michael Pchelnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let squareView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        bind()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.gray
        
        squareView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        
        view.addSubview(squareView)
    }
    
    private func setupConstraints() {
        squareView.mrk.centerX(to: view)
        squareView.mrk.centerY(to: view)
        squareView.mrk.width(100)
        squareView.mrk.height(100)
    }
    
    private func bind() {
        
    }
}

