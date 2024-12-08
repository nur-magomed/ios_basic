//
//  ViewController.swift
//  hw9
//
//  Created by Nur-Magomed Arsakhanov on 08.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var copyBtn: UIButton!
    
    @IBOutlet weak var surnameLbl: UILabel!
    
    @IBOutlet weak var firtnameLbl: UILabel!
    
    @IBOutlet weak var fatherName: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var nameToggleSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClickedCopyBtn(_ sender: UIButton) {
        UIPasteboard.general.string = addressLbl.text
    }
    
    @IBAction func onClickNameToggle(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            surnameLbl.isHidden = false
            fatherName.isHidden = false
        } else if (sender.selectedSegmentIndex == 1) {
            surnameLbl.isHidden = true
            fatherName.isHidden = true
        }
    }
    
}

