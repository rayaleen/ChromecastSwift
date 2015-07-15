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
    
    func updateMiniControlState(viewController : UIViewController){
        self.currentViewController = viewController
    }
    
    func connectToDevice(device : GCKDevice) {
        self.deviceManager = GCKDeviceManager(device: device, clientPackageName: "")
        self.deviceManager.delegate = self
        self.deviceManager.connect()
    }
    
    func chromecastButtonDidClick() {
        if let currentViewController = self.currentViewController {
            let viewController = UINavigationController(rootViewController: ChromecastDevicesListViewController(chromecastDeviceController: self))
            currentViewController.presentViewController(viewController, animated: true, completion: { () -> Void in
                
            })
        }
    }
}


// MARK: - GCKDeviceManagerDelegate
extension ChromecastDeviceController : GCKDeviceManagerDelegate{
    
    func deviceManagerDidConnect(deviceManager: GCKDeviceManager!) {
        self.lastDeviceID = deviceManager.device.deviceID
        println("deviceManagerDidConnect")
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!, didConnectToCastApplication applicationMetadata: GCKApplicationMetadata!, sessionID: String!, launchedApplication: Bool) {
        self.isReconnecting = false
        
        println("didConnectToCastApplication")
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!, didReceiveApplicationMetadata metadata: GCKApplicationMetadata!) {
        
        println("didReceiveApplicationMetadata")
        
    }
    
    func deviceManagerDidResumeConnection(deviceManager: GCKDeviceManager!, rejoinedApplication: Bool) {
        
    }
    
}

// MARK: - GCKDeviceScannerListener
extension ChromecastDeviceController : GCKDeviceScannerListener{
    
    func deviceDidComeOnline(device: GCKDevice!) {
        if let lastDeviceID = self.lastDeviceID where lastDeviceID == device.deviceID {
            self.isReconnecting = true
            self.connectToDevice(device)
        }
        println("device \(device.friendlyName) did come online")
    }
    
    func deviceDidChange(device: GCKDevice!) {
        println("device \(device.friendlyName) did change")
    }
    
    func deviceDidGoOffline(device: GCKDevice!) {
        println("device \(device.friendlyName) did go offline")
    }
}


// MARK: - GCKMediaControlChannelDelegate
extension ChromecastDeviceController : GCKMediaControlChannelDelegate{
    func mediaControlChannel(mediaControlChannel: GCKMediaControlChannel!, didCompleteLoadWithSessionID sessionID: Int) {
        
    }
    
    func mediaControlChannelDidUpdateMetadata(mediaControlChannel: GCKMediaControlChannel!) {
        
    }
    
    func mediaControlChannelDidUpdateStatus(mediaControlChannel: GCKMediaControlChannel!) {
        
    }
}