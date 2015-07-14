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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initDeviceListTableView() {
        self.deviceListTableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.deviceListTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "deviceCell")
        self.view.addSubview(self.deviceListTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
