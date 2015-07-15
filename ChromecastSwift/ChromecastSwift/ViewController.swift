//
//  ViewController.swift
//  ChromecastSwift
//
//  Created by chenbo on 14/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var connectButton: UIButton!
    lazy var deviceController = (UIApplication.sharedApplication().delegate as! AppDelegate).chromecastDeviceController!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.deviceController.updateMiniControlState(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.connectButton.addTarget(self, action:"connectButtonDidClick", forControlEvents: .TouchUpInside)
        let barButtonItem = UIBarButtonItem(customView: self.deviceController.chromecastButton)
        self.navigationItem.rightBarButtonItem = barButtonItem
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func connectButtonDidClick() {
        self.deviceController.connectToDevice(deviceController.deviceScanner.devices[0] as! GCKDevice)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

