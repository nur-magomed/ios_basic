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
    private var firstLabelLeadingAnchorLandscape: NSLayoutConstraint?
    private var firstLabelYcenterLandscape: NSLayoutConstraint?
    private var secondLabelLeadingAnchorLandscape: NSLayoutConstraint?
    private var secondLabelYcenterLandscape: NSLayoutConstraint?
    private var secondLabelTrailingAnchorLandscape: NSLayoutConstraint?
    
    private var landscapeSpacingWidth: CGFloat = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        // Do any additional setup after loading the view.
        view.addSubview(childView)
        childView.addSubview(image)
        childView.addSubview(firstLabel)
        childView.addSubview(secondLabel)
        imageXcenterPortrait = image.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        imageYcenterPortrait = image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height/10 * -1)
        bottomImagePortrait = image.bottomAnchor.constraint(lessThanOrEqualTo: firstLabel.topAnchor, constant: -10)
        firstLabelXcenterPortrait = firstLabel.centerXAnchor.constraint(equalTo: childView.centerXAnchor, constant: 0)
        secondLabelXcenterPortrait = secondLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: childView.centerXAnchor, multiplier: 1)
        secondLabelYcenterPortrait = secondLabel.centerYAnchor.constraint(equalTo: firstLabel.centerYAnchor, constant: 30)
        
        imageYcenterLandscape = image.centerYAnchor.constraint(equalTo: childView.centerYAnchor, constant: 0)
        imageLeadingAnchorLandscape = image.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20)
  
        firstLabelYcenterLandscape = firstLabel.centerYAnchor.constraint(equalTo: childView.centerYAnchor, constant: 0)
        secondLabelYcenterLandscape = secondLabel.centerYAnchor.constraint(equalTo: childView.centerYAnchor, constant: 0)

        secondLabelTrailingAnchorLandscape = secondLabel.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20)
        
//        topImage = image.topAnchor.constraint(equalTo: childView.centerYAnchor, constant: view.frame.height/10 * -1)
//        topImage?.priority = .init(999)
//        bottomImage?.priority = .init(1000)
        
        createPortraitConstraints()
    }

    
    func createPortraitConstraints() {
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50),
            imageXcenterPortrait!,
            imageYcenterPortrait!,
            bottomImagePortrait!,
            firstLabelXcenterPortrait!,
            secondLabelXcenterPortrait!,
            secondLabelYcenterPortrait!,
            
            childView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            childView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            childView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
//            topImage!,
//            bottomImage!
        ])
        NSLayoutConstraint.deactivate([

            
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

            firstLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: landscapeSpacingWidth),
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.trailingAnchor, constant: landscapeSpacingWidth),
            firstLabelYcenterLandscape!,
            secondLabelYcenterLandscape!,
        ])
    }
    
    @objc
    func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            print(childView.frame.width)
            print(image.frame.width)
            print(firstLabel.frame.width)
            print(secondLabel.frame.width)
            landscapeSpacingWidth = (childView.frame.width - image.frame.width - firstLabel.frame.width - secondLabel.frame.width - 40) / 2
            print(landscapeSpacingWidth)
            
           
            createLandscapeConstraints()
          
            
        }

        if UIDevice.current.orientation.isPortrait {
            print("Portrait")
            createPortraitConstraints()
        }
    }
    
    func deactivateConstraints() {
        firstLabel.constraints.forEach { $0.isActive = false }
        secondLabel.constraints.forEach { $0.isActive = false }
        image.constraints.forEach { $0.isActive = false }
    }

}

