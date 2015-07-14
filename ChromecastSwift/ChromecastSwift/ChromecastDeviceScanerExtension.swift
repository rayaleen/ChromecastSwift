//
//  ChromecastDeviceConctrollerScanExtension.swift
//  ChromecastSwift
//
//  Created by chenbo on 14/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import Foundation
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