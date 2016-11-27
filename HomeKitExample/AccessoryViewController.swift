//
//  AccessoryViewController.swift
//  HomeKitExample
//
//  Created by Ellina Kuznecova on 27.11.16.
//  Copyright © 2016 Flatstack. All rights reserved.
//

import UIKit
import HomeKit

class AccessoryViewController: UIViewController {
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    var accessory: HMAccessory?
    var characteristics: [HMCharacteristic] = []
    
    
    @IBAction func switchValueChanged(_ sender: Any) {
        self.characteristics.first?.writeValue(self.onOffSwitch.isOn, completionHandler: { (error) in
            if let error = error {print(error)}
        })
    }
}
