//
//  Model.swift
//  testoperation
//
//  Created by csj on 15/8/14.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import Foundation

class BaseOperationInfo {
    
    var operationID: Int
    
    var info: String?
    
    var delegate: (Void -> Void)?
    
    init (operationID: Int) {
        self.operationID = operationID
    }
}

class BaseOperation: NSOperation {
    
    var operationInfo: BaseOperationInfo! {
        didSet {
            if let delegate = operationInfo.delegate {
                self.completionBlock = delegate
            }
        }
    }

    override func main() {
        sleep(1)
        println("download operation over")
    }
}

class OperationManager: NSObject {
    var queue: NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
        }()
    
    var operations: [NSOperation] = []
    
    func operationFinish() {
        println("a operation finish")
    }
    
    func addOperation(operation: NSOperation) {
        operation.completionBlock = operationFinish
        queue.addOperation(operation)
    }
    
    func addOperations(operations: [NSOperation]) {
        queue.addOperations(operations, waitUntilFinished: true)
    }
    
    
}
