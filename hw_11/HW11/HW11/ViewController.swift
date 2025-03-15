//
//  ViewController.swift
//  HW11
//
//  Created by Nur-Magomed A on 25.01.2025.
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
        uiImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
     
        return uiImage
    }()
    
    private var topImage: NSLayoutConstraint?
    private var bottomImagePortrait: NSLayoutConstraint?
    private var imageXcenterPortrait: NSLayoutConstraint?
    private var imageYcenterPortrait: NSLayoutConstraint?
    private var firstLabelXcenterPortrait: NSLayoutConstraint?
    private var secondLabelXcenterPortrait: NSLayoutConstraint?
    private var secondLabelYcenterPortrait: NSLayoutConstraint?
    
    
    private var imageYcenterLandscape: NSLayoutConstraint?
    private var imageLeadingAnchorLandscape: NSLayoutConstraint?
    private var firstLabelYcenterLandscape: NSLayoutConstraint?
    private var secondLabelLeadingAnchorLandscape: NSLayoutConstraint?
    private var secondLabelYcenterLandscape: NSLayoutConstraint?
    private var secondLabelTrailingAnchorLandscape: NSLayoutConstraint?
    private var firstLabelLeadingAnchorLandscape: NSLayoutConstraint?
    private var secondLabelLeadinAnchorLandscape: NSLayoutConstraint?
    
    private var landscapeSpacingWidth: CGFloat = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        // Do any additional setup after loading the view.
        view.addSubview(childView)
        childView.addSubview(image)
        childView.addSubview(firstLabel)
        childView.addSubview(secondLabel)
        childView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        childView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        childView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        childView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageXcenterPortrait = image.centerXAnchor.constraint(equalTo: childView.centerXAnchor, constant: 0)
        imageYcenterPortrait = image.centerYAnchor.constraint(equalTo: childView.centerYAnchor, constant: view.frame.height/10 * -1)
        bottomImagePortrait = image.bottomAnchor.constraint(lessThanOrEqualTo: firstLabel.topAnchor, constant: -10)
        firstLabelXcenterPortrait = firstLabel.centerXAnchor.constraint(equalTo: childView.centerXAnchor, constant: 0)
        secondLabelXcenterPortrait = secondLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: childView.centerXAnchor, multiplier: 1)
        secondLabelYcenterPortrait = secondLabel.centerYAnchor.constraint(equalTo: firstLabel.centerYAnchor, constant: 30)
        
        imageYcenterLandscape = image.centerYAnchor.constraint(equalTo: childView.centerYAnchor, constant: 0)
        imageLeadingAnchorLandscape = image.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20)
  
        firstLabelYcenterLandscape = firstLabel.centerYAnchor.constraint(equalTo: childView.centerYAnchor, constant: 0)
        secondLabelYcenterLandscape = secondLabel.centerYAnchor.constraint(equalTo: childView.centerYAnchor, constant: 0)

        secondLabelTrailingAnchorLandscape = secondLabel.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20)
        firstLabelLeadingAnchorLandscape = firstLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 70)
        secondLabelLeadinAnchorLandscape = secondLabel.leadingAnchor.constraint(equalTo: firstLabel.trailingAnchor, constant: 70)
        
        createPortraitConstraints()
    }

    
    func createPortraitConstraints() {
        print(landscapeSpacingWidth)
        NSLayoutConstraint.deactivate([
            imageYcenterLandscape!,
            imageLeadingAnchorLandscape!,
            secondLabelTrailingAnchorLandscape!,

            firstLabelLeadingAnchorLandscape!,
            secondLabelLeadinAnchorLandscape!,
            firstLabelYcenterLandscape!,
            secondLabelYcenterLandscape!,
            
        ])
        
        NSLayoutConstraint.activate([
            imageXcenterPortrait!,
            imageYcenterPortrait!,
            bottomImagePortrait!,
            firstLabelXcenterPortrait!,
            secondLabelXcenterPortrait!,
            secondLabelYcenterPortrait!,
        ])

    }
    
    func createLandscapeConstraints() {
        NSLayoutConstraint.deactivate([
            imageXcenterPortrait!,
            imageYcenterPortrait!,
            bottomImagePortrait!,
            firstLabelXcenterPortrait!,
            secondLabelXcenterPortrait!,
            secondLabelYcenterPortrait!,
        ])

        
        NSLayoutConstraint.activate([
            imageYcenterLandscape!,
            imageLeadingAnchorLandscape!,
            secondLabelTrailingAnchorLandscape!,

            firstLabelLeadingAnchorLandscape!,
            secondLabelLeadinAnchorLandscape!,
            firstLabelYcenterLandscape!,
            secondLabelYcenterLandscape!,
        ])
    }
    
    @objc
    func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            createLandscapeConstraints()
        }

        if UIDevice.current.orientation.isPortrait {
            print("Portrait")
            createPortraitConstraints()
        }
    }

}

