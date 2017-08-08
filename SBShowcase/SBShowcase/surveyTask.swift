//
//  surveyTask.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-08-02.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import Foundation
import ResearchKit




var surveyTask: ORKOrderedTask{
    
    var steps = [ORKStep]()
    
    
    //INTRODUCTION STEP 
    
    
    let introStep = ORKInstructionStep(identifier: "introStep");
        introStep.title = "Introduction into Surveys"
        introStep.text = "With ResearchKit it is incredible easy to do survey's and collect patient data"
    
    steps += [introStep]

    
    
    
    // NAME STEP
    let nameTitle = "What is your name?"
    let nameAnswerFormat = ORKTextAnswerFormat()
    let nameStep = ORKQuestionStep(identifier: "nameStep", title: nameTitle, answer: nameAnswerFormat)
    
    steps += [nameStep]
    
    
    // AGE QUESTION 
    
    let ageTitle = "What is your age in years?"
    let ageAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "years")
    let ageStep = ORKQuestionStep(identifier: "ageStep", title: ageTitle, answer: ageAnswerFormat)
    
    steps += [ageStep]

    
    
    // SEX QUESTION
    
    let sexTitle = "What is your sex?"
    let sexChoices = [
        ORKTextChoice(text: "Male", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Female", value: 1 as NSCoding & NSCopying & NSObjectProtocol) ]
    let sexAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: sexChoices)
    
    let sexStep = ORKQuestionStep(identifier: "sexStep", title: sexTitle, answer: sexAnswerFormat)
    
    steps += [sexStep]

    
    // Height Question
    
    let hTitle = "What is your height in cm?"
    let hAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "cm")
    let hStep = ORKQuestionStep(identifier: "hStep", title: hTitle, answer: hAnswerFormat)
    
    steps += [hStep]

    
    
    // IMAGE CHOICE QUESTION
    let step1title = "Over the last 2 weeks, how often have you had little interest or reduced pleasure in doing things?"
    let step1imagechoices = [ ORKImageChoice(normalImage: #imageLiteral(resourceName: "key0"), selectedImage: #imageLiteral(resourceName: "key0f"), text: "Not at all", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                              ORKImageChoice(normalImage: #imageLiteral(resourceName: "key1"), selectedImage: #imageLiteral(resourceName: "key1f"), text: "Several days", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                              ORKImageChoice(normalImage: #imageLiteral(resourceName: "key2"), selectedImage: #imageLiteral(resourceName: "key2f"), text: "More than half the days", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                              ORKImageChoice(normalImage: #imageLiteral(resourceName: "key3"), selectedImage: #imageLiteral(resourceName: "key3f"), text: "Nearly every day", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let step1AnswerFormat = ORKImageChoiceAnswerFormat(imageChoices: step1imagechoices)
    
    let step1QuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: step1title, answer: step1AnswerFormat)
    
    
    steps += [step1QuestionStep]

   
    // SCALE QUESTION 
    
    let scaleTitle = "On a scale of 1-10 how are you feeling today?"
    
    
    let scaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 10, minimumValue: 1, defaultValue: 5, step: 1, vertical: true)
    
    let scaleStep = ORKQuestionStep(identifier: "scaleQuestionStep",
                                    title: scaleTitle, answer: scaleAnswerFormat)
    
    steps += [scaleStep]
    
    
    
    // TIME QUESTION 
    
    let timeTitle = "What time do you usually eat lunch?"
    
    let timeAnswerFormat = ORKTimeOfDayAnswerFormat()
    
    let timeStep = ORKQuestionStep(identifier: "timeStep",
                                   title: timeTitle,
                                   answer: timeAnswerFormat)
    
    steps += [timeStep]
    
    
    
    
    // ALCOHOL QUESTION
    
    let alcoholQuestionStepTitle = "Do you consume alcohol?"
    let alcoholAnswerFormat = ORKBooleanAnswerFormat()
    let alcoholQuestionStep = ORKQuestionStep(identifier: "AlcoholQuestionStep", title: alcoholQuestionStepTitle, answer: alcoholAnswerFormat)
    
    let alcoholYesQuestionStepTitle = "On average, how many beverages containing alcohol do you consume in a day?"
    let alcoholYesAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "beverages")
    let alcoholYesQuestionStep = ORKQuestionStep(identifier: "AlcoholYesQuestionStep", title: alcoholYesQuestionStepTitle, answer: alcoholYesAnswerFormat)
    
    
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thank you."
    summaryStep.text = "We appreciate your time."
    
    
    steps += [alcoholQuestionStep, alcoholYesQuestionStep, summaryStep]
    
    
    
    // END OF QUESTIONS, ESTABLISH RULES. ================================================
    
    
    let task = ORKNavigableOrderedTask(identifier: "surveyTask", steps: steps)
    
    
    
    let alcoholPredicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "AlcoholQuestionStep"), expectedAnswer: false)
    let alcoholRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: alcoholPredicate, destinationStepIdentifier: "CholQuestionStep")])
    
    task.setNavigationRule(alcoholRule, forTriggerStepIdentifier: "AlcoholQuestionStep")
    
    
 return task
}
