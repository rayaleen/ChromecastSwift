//
//  ChromecastDevicesListViewController.swift
//  ChromecastSwift
//
//  Created by chenbo on 14/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import UIKit

class ChromecastDevicesListViewController: UIViewController {
    var deviceListTableView : UITableView!
    weak var chromecastDeviceController : ChromecastDeviceController!
    
    init(chromecastDeviceController :ChromecastDeviceController) {
        super.init(nibName: nil, bundle: nil)
        self.chromecastDeviceController = chromecastDeviceController
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.initDeviceListTableView()
        // Do any additional setup after loading the view.
    }
    
    func initDeviceListTableView() {
        self.deviceListTableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.deviceListTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "deviceCell")
        self.deviceListTableView.backgroundColor = UIColor.whiteColor();
        self.view.addSubview(self.deviceListTableView)
    }
}


// MARK: - UITableViewDataSource
extension ChromecastDevicesListViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.chromecastDeviceController.deviceManager.connectionState == GCKConnectionState.Connected {
            return 2
        }else{
            return self.chromecastDeviceController.deviceScanner.devices.count
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell
        
        return UITableViewCell();
    }
    
    
}

extension ChromecastDevicesListViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
}