//
//  PopupView.swift
//  Color_Match_App
//
//  Created by Ellen Liu on 2020-03-21.
//  Copyright © 2020 Ellen Liu. All rights reserved.
//

import UIKit

protocol PopupDelegate {
    func handleDismissal()
}

class PopupView: UIView {
    
    var delegate: PopupDelegate?
    
    fileprivate let checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 96, weight: .bold)
        label.text = "✔️"
        label.textColor = UIColor(red: 147, green: 227, blue: 105)
        label.textAlignment = .center
        return label
    }()

    fileprivate let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Correct!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        addSubview(checkLabel)
        checkLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        checkLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismissal(){
        delegate?.handleDismissal()
    }
}

