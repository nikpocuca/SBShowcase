//
//  ViewController.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-07-26.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    
    
    @IBOutlet weak var beginOut: UIButton!
    
    
    
    // Background Assignment 
    
    func assignbackground(){
        let background = #imageLiteral(resourceName: "back")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        assignbackground()

        beginOut.layer.borderColor = UIColor.white.cgColor
        beginOut.layer.cornerRadius = 2;
        beginOut.layer.borderWidth = 1;
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
     
        // Dispose of any resources that can be recreated.
    }


}

