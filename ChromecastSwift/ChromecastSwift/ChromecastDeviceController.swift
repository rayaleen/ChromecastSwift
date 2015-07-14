//
//  ChromecastDeviceController.swift
//  ChromecastSwift
//
//  Created by chenbo on 14/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import Foundation

class ChromecastDeviceController : NSObject {
    var deviceManager : GCKDeviceManager!
    var deviceScanner : GCKDeviceScanner!
    
    var mediaControlChannel : GCKMediaControlChannel?
    
    weak var currentViewController : UIViewController?
    
    var isReconnecting : Bool = false
    var lastDeviceID : NSString? {
        set (newDeviceID){
            if newDeviceID == nil {
                NSUserDefaults.standardUserDefaults().removeObjectForKey("lastDeviceIDKey")
            }else {
                NSUserDefaults.standardUserDefaults().setObject(newDeviceID, forKey: "lastDeviceIDKey")
            }
        }
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey("lastDeviceIDKey")
        }
    }
    
    var chromecastButton : UIButton {
        get {
            let button : UIButton = UIButton.buttonWithType(.Custom) as! UIButton
            button.addTarget(self, action: "chromecastButtonDidClick", forControlEvents: .TouchUpInside)
            button.setImage(UIImage(named: "CastButton"), forState: .Normal)
            button.sizeToFit()
            return button
        }
    }
    
    
    init(applicationID : String) {
        super.init()
        self.initDeviceScanner(applicationID)
    }
    
    func initDeviceScanner(applicationID : String){
        self.deviceScanner = GCKDeviceScanner(filterCriteria: GCKFilterCriteria(forAvailableApplicationWithID: applicationID))
        self.deviceScanner.addListener(self)
        self.deviceScanner.startScan()
    }
    
    func connectToDevice(device : GCKDevice) {
        self.deviceManager = GCKDeviceManager(device: device, clientPackageName: "")
        self.deviceManager.delegate = self
        self.deviceManager.connect()
    }
    
    func chromecastButtonDidClick() {
        println("chromecast did click")
    }
}