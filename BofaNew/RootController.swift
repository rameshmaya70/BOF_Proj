//
//  RootController.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 3/1/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class RootController: UIViewController {
    
    var animator:UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

       NSNotificationCenter.defaultCenter().addObserver(self, selector: "launchNotifFired", name: "appLaunched", object: nil)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func launchNotifFired(){
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if appdelegate.notifFired{
            self.performSegueWithIdentifier("Overlay", sender: nil)
            addAnimation()
        }
    }
    
    func addDynamics(){
        let childControler:UIViewController = self.childViewControllers[0] as UIViewController
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let gravityBevaviour:UIGravityBehavior = UIGravityBehavior(items: [childControler.view])
        animator.addBehavior(gravityBevaviour)
        
        let collisionBevaviour:UICollisionBehavior = UICollisionBehavior(items: [childControler.view])
        collisionBevaviour.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBevaviour)
        
        let elasticityBehaviour:UIDynamicItemBehavior = UIDynamicItemBehavior(items: [childControler.view])
        elasticityBehaviour.elasticity = 0.7
         animator.addBehavior(elasticityBehaviour)
        
    }
    
    func addAnimation(){
        
        let childViewController = self.childViewControllers[0] as UIViewController
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping:0.3, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            childViewController.view.frame = self.view.bounds
        }), completion: nil)
       }
}