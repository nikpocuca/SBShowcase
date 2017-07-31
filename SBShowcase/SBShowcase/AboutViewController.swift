//
//  AboutViewController.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-07-27.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    
    
    // DECLARATION OF BACKROUND FUNCTION
    func assignbackground(){
        let background = #imageLiteral(resourceName: "aboutBack")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    
    
    @IBOutlet weak var contOut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        
        
        // Continue button outlet.
        contOut.layer.borderWidth = 1;
        contOut.layer.borderColor = UIColor.white.cgColor;
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
