//
//  spacialTask.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-08-02.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit


public var spacialTask: ORKOrderedTask {
    
    
    let task =  ORKOrderedTask.spatialSpanMemoryTask(withIdentifier: "spacialTask",
                                                     intendedUseDescription: "Please attempt to follow the instructions correctly",
                                                     initialSpan: 5, minimumSpan: 5,
                                                     maximumSpan: 5, playSpeed: 0.5,
                                                     maximumTests: 2, maximumConsecutiveFailures: 5,
                                                     customTargetImage: #imageLiteral(resourceName: "rhombus"), customTargetPluralName: "Test",
                                                     requireReversal: false, options: ORKPredefinedTaskOption())
    return task
    
}

