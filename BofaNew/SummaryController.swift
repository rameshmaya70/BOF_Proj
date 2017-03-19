//
//  SummaryController.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 2/27/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class SummaryController: UIViewController {

    @IBOutlet weak var eventWheel: UIImageView!
    @IBOutlet weak var stockWheel: UIImageView!
    @IBOutlet weak var reminderWheel: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addRotationOnWheels(imageView:UIImageView){
    
        let animation = CABasicAnimation(keyPath:"transform.rotation.z")
        animation.fromValue = 0.0
        animation.toValue = 2*M_PI
        animation.duration = 10.0
        animation.repeatCount = 100
        imageView.layer.addAnimation(animation, forKey: "SpinAnimation")
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
