//
//  taskViewController.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-08-02.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit
import ResearchKit
import CoreMotion



class taskViewController: UIViewController {

    @IBOutlet weak var backOut: UIButton!
    
    
    @IBAction func tohTapped(_ sender: Any) {
        
        let taskViewController = ORKTaskViewController(task: TOHTask, taskRun: nil)
        taskViewController.delegate = self
        
        
        present(taskViewController, animated: true, completion: nil)
        

        
    }
    
    
    @IBAction func specialTap(_ sender: Any) {
        
        
        let taskViewController = ORKTaskViewController(task: spacialTask, taskRun: nil)
        taskViewController.delegate = self
        
        
        present(taskViewController, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func walkTap(_ sender: Any) {
        
     
        let taskViewController = ORKTaskViewController(task: walkingTask, taskRun: NSUUID() as UUID)
        taskViewController.delegate = self
        
        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] , isDirectory: true) as URL
        
        
        
        present(taskViewController, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.appearance().tintColor = UIColor.purple
        
        
        
        backOut.layer.borderWidth = 1;
        backOut.layer.borderColor = UIColor.white.cgColor
        
        backOut.layer.cornerRadius = 4;
        
        
        

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    


}


extension taskViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
        
        
        
        
    }
}

