//
//  SwipeTopSegue.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 3/1/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class SwipeTopSegue: UIStoryboardSegue {
    
     override func perform() {
        
        let childController = self.destinationViewController as UIViewController
        let parentController = self.sourceViewController as UIViewController
        
        UIView.animateWithDuration(0.2, animations: {
            
            let frame = parentController.view.frame
            childController.view.frame = CGRect(x: 0, y:-frame.size.height, width: frame.size.width, height: frame.size.height)
            }, completion: {
                (value: Bool) in
                
                childController.willMoveToParentViewController(parentController)
                childController.view.removeFromSuperview()
                childController.removeFromParentViewController()
        })
        
        
        
    }
   
}
