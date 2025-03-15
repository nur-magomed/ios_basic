//
//  UserDetailsViewController.swift
//  HW10
//
//  Created by Nur-Magomed Arsakhanov on 19.01.2025.
//

import UIKit
import Firebase
import FirebaseCrashlytics
import FirebaseAnalytics

class UserDetailsViewController: UIViewController {
    
    
    var user: User?
    
    @IBOutlet private weak var userNameLabel: UILabel!
    
    @IBOutlet private weak var userPositionLabel: UILabel!
    
    @IBOutlet private weak var userAddressLabel: UILabel!
    
    @IBOutlet private weak var nameToggleSegment: UISegmentedControl!
    
    @IBOutlet private weak var copyBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Details"
        
        userNameLabel.text = user?.firstName
        userPositionLabel.text = user?.jobPosition
        userAddressLabel.text = user?.address
    }
    
    
    @IBAction func onClickNameToggle(_ sender: UISegmentedControl) {
        Analytics.logEvent("clicked_name_toggle", parameters: ["user" : "\(user?.firstName ?? "default user")"])
        if (sender.selectedSegmentIndex == 0) {
            userNameLabel.text = user?.firstName
        } else if (sender.selectedSegmentIndex == 1) {
            userNameLabel.text = user?.fullName
        }
    }
    
    
    @IBAction func onClickCopyBtn(_ sender: UIButton) {
        Crashlytics.crashlytics().log("clicked on copy address")
        Analytics.logEvent("copied_address", parameters: ["user" : "\(user?.firstName ?? "default user")"])
        UIPasteboard.general.string = userAddressLabel.text
    }
    
    
    @IBAction func onClickTestAppCrash(_ sender: Any) {
        Crashlytics.crashlytics().log("user \(user?.firstName ?? "default user") crashed the app")
        Analytics.logEvent("crashing_app", parameters: ["user" : "\(user?.firstName ?? "default user")"])
        
        let numbers = [0]
        let _ = numbers[1]
    }
    
}
