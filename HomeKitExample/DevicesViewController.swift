//
//  DevicesViewController.swift
//  HomeKitExample
//
//  Created by Ellina Kuznecova on 26.11.16.
//  Copyright © 2016 Flatstack. All rights reserved.
//

import UIKit
import HomeKit

class DevicesViewController: UITableViewController {
    struct AccessoryAddSegue {
        static let indentifier = "toAccessoryAdding"
    }
    
    var room: HMRoom?
    var devices: [HMAccessory] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeManager.delegate = self
        
        self.devices = self.room?.accessories ?? []
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? AccessorySearcherViewController)?.roomToAdd = self.room
    }
    
    @IBAction func addPressed(_ sender: Any) {
        self.performSegue(withIdentifier: AccessoryAddSegue.indentifier, sender: nil)
    }
}

extension DevicesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.devices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic")!
        cell.textLabel?.text = self.devices[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: DevicesSegue.identifier, sender: DevicesSegue(selectedRoom: self.devices[indexPath.row]))
    }
}

extension DevicesViewController: HMHomeManagerDelegate {
    
}
