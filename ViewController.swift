//
//  ViewController.swift
//  testoperation
//
//  Created by csj on 15/8/14.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var opr = BaseOperation()
        
        var manager = OperationManager()
        
        manager.addOperation(opr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

