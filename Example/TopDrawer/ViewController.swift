//
//  ViewController.swift
//  TopDrawer
//
//  Created by Justin Kaufman on 7/24/19.
//  Copyright © 2019 Justin Kaufman. All rights reserved.
//

import UIKit
import TopDrawer

class ViewController: UIViewController {
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let toggleButton = UIButton()
    private let topDrawer = TopDrawer()

    init() {
        super.init(nibName: nil, bundle: nil)
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ViewController {
    func setupSubviews() {
        titleLabel.text = "TopDrawer"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        detailLabel.text = "By Justin Kaufman"
        detailLabel.textAlignment = .center
        detailLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        toggleButton.backgroundColor = UIColor.white
        toggleButton.setTitleColor(.black, for: .normal)
        toggleButton.setTitleColor(.darkGray, for: .highlighted)
        toggleButton.setTitle("Toggle Visibility", for: .normal)
        toggleButton.addTarget(self, action: #selector(didTapToggle(_:)), for: .touchUpInside)
        toggleButton.contentEdgeInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.layer.masksToBounds = true
        toggleButton.layer.cornerRadius = 16.0
        toggleButton.layer.borderColor = UIColor.lightGray.cgColor
        toggleButton.layer.borderWidth = 1.5

        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        view.addSubview(detailLabel)
        view.addSubview(toggleButton)
        view.addSubview(topDrawer)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150.0)
        ])

        NSLayoutConstraint.activate([
            self.detailLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.detailLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8.0)
        ])

        NSLayoutConstraint.activate([
            self.toggleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.toggleButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60.0)
        ])
    }

    @objc func didTapToggle(_ sender: UIButton) {
        
    }
}
