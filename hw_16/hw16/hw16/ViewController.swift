//
//  ViewController.swift
//  hw16
//
//  Created by Nur-Magomed on 27.02.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Singleton check
        var myCache = AppCache.instance
        print(myCache.get(key: "one") ?? "empty")
        myCache.set(key: "one", value: "numberOne")
        print(myCache.get(key: "one") ?? "empty")
        
        IPadUIFactory().createButton(name: "Hello, World!")
        IPhoneUIFactory().createButton(name: "Hello, World!")
        MacBookUIFactory().createButton(name: "Hello, World!")
    }


}

