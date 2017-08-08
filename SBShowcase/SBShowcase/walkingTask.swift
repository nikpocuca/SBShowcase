//
//  walkingTask.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-08-04.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit



public var walkingTask: ORKOrderedTask  {
    
   /* let task = ORKOrderedTask.shortWalk(withIdentifier: "walkingTask", intendedUseDescription: "Please go for a walk", numberOfStepsPerLeg: 20, restDuration: 5, options: ORKPredefinedTaskOption())
    
    */
    
    let task = ORKOrderedTask.timedWalk(withIdentifier: "walkingTask", intendedUseDescription: "Please go for a walk", distanceInMeters: 4, timeLimit: 30, includeAssistiveDeviceForm: true, options: ORKPredefinedTaskOption())
    
    
    
    
    
    return task;
}
