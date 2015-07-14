//
//  ChromecastDeviceManagerExtension.swift
//  ChromecastSwift
//
//  Created by chenbo on 14/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import Foundation
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