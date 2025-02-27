//
//  ViewController.swift
//  HW11
//
//  Created by Nur-Magomed Arsakhanov on 25.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var childView: UIView = {
        let cutomView = UIView()
        cutomView.translatesAutoresizingMaskIntoConstraints = false
        cutomView.backgroundColor = .systemMint
        
        return cutomView
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemYellow
        label.text = "First label"
        
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemRed
        label.text = "Second label"
        
        return label
    }()
    
    private lazy var image: UIImageView = {
        let uiImage = UIImageView()
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        uiImage.image = UIImage(systemName: "multiply.circle.fill")
        uiImage.tintColor = .cyan
     
        return uiImage
    }()
    
    private var topImage: NSLayoutConstraint?
    private var bottomImage: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(childView)
        childView.addSubview(image)
        childView.addSubview(firstLabel)
        childView.addSubview(secondLabel)

        bottomImage = image.bottomAnchor.constraint(lessThanOrEqualTo: firstLabel.topAnchor, constant: -10)
        topImage = image.topAnchor.constraint(equalTo: childView.centerYAnchor, constant: view.frame.height/10 * -1)
        topImage?.priority = .init(999)
        bottomImage?.priority = .init(1000)
        
        createConstraints()
    }

    
    func createConstraints() {
        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            childView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            childView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            firstLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: childView.centerYAnchor, multiplier: 1),
            firstLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: childView.centerXAnchor, multiplier: 1),
            
            secondLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: childView.centerXAnchor, multiplier: 1),
            secondLabel.centerYAnchor.constraint(equalTo: firstLabel.centerYAnchor, constant: 30),
            
            image.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 8),
            topImage!,
            bottomImage!
        ])
    }

}

