//
//  ViewController.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 2/24/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dismissBn: UIButton!
    @IBOutlet weak var container: UIView!
  
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var detailBn: UIButton!
    @IBOutlet weak var summaryBn: UIButton!
    @IBAction func segmentAction(sender: AnyObject) {
        
        let button = sender as! UISegmentedControl
        let tag = button.selectedSegmentIndex
        
        if tag==0{
            self.performSegueWithIdentifier("Summary", sender: nil)

        }else{
            self.performSegueWithIdentifier("Detail", sender: nil)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.performSegueWithIdentifier("Summary", sender: nil)
        
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func unwind(segue:UIStoryboardSegue){
        let childController = segue.destinationViewController as UIViewController
        let parentController = self
        
        UIView.animateWithDuration(0.5, animations: {
            
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

