//
//  analyticsViewController.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-08-02.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit
import ResearchKit






class analyticsViewController: UIViewController, ORKPieChartViewDataSource {

    
    @IBOutlet weak var pieChartView: ORKPieChartView!
    
    
    
    
    
    
    
    
    func numberOfSegments(in pieChartView: ORKPieChartView ) -> Int {
        return 4;
    }
    
    /*
     
     2 more of the same functions as above???
     
     */
    
    
    
    // enumeration of two segments.
    enum PieChartSegment: Int {
        case mood, apnea, cog, Remaining
    }
    
    // Segment Values, refer to activity Percent.
    public func pieChartView(_ pieChartView: ORKPieChartView, valueForSegmentAt index: Int) -> CGFloat {
        switch PieChartSegment(rawValue: index)! {
        case .mood:
            return 20
        case .apnea:
            return 15
        case .cog:
            return 40
        case .Remaining:
            return 100 - 75        }
    }
    
    
    
    /*
     2 More segments here???
     
     */
    
    
    // Segment Colours.
    public func pieChartView(_ pieChartView: ORKPieChartView, colorForSegmentAt index: Int) -> UIColor {
        switch PieChartSegment(rawValue: index)! {
        case .mood:
            return UIColor.red
        case .apnea:
            return UIColor.green
        case .cog:
            return UIColor.purple
        case .Remaining:
            return UIColor.white
        }
    }
    
    
    
    
    /*
     2 more colour sets here???
     */
    
    
    
    // Titles for segments
    public func pieChartView(_ pieChartView: ORKPieChartView, titleForSegmentAt index: Int) -> String {
        switch PieChartSegment(rawValue: index)! {
        case .mood:
            return NSLocalizedString("Mood", comment: "")
        case .apnea:
            return NSLocalizedString("Apnea", comment: "")
        case .cog:
            return NSLocalizedString("Cognition", comment: "")
        case .Remaining:
            return NSLocalizedString("", comment: "")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        pieChartView.reloadData()
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    pieChartView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    



}





// extension of view controller.
extension analyticsViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
}






