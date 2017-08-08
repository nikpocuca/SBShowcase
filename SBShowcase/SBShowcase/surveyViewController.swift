//
//  surveyViewController.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-08-01.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit
import ResearchKit

class surveyViewController: UIViewController {

    
    
    
    
    
    @IBAction func surveyTap(_ sender: Any) {
        
        let taskViewController = ORKTaskViewController(task: surveyTask, taskRun: nil)
        taskViewController.delegate = self
        
        
        present(taskViewController, animated: true, completion: nil)
        

        
        
    }
    
    
    
    
    
    
    
    
    
    
    
      @IBOutlet weak var nextOut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}



extension surveyViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)



        
    }
}
