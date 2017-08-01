//
//  ConsentViewController.swift
//  SBShowcase
//
//  Created by Nik Pocuca on 2017-08-01.
//  Copyright © 2017 Nik Pocuca. All rights reserved.
//

import UIKit
import ResearchKit





class ConsentViewController: UIViewController {

 
    let ConsentReviewStepIdentifier = "ConsentReviewStep"
    let consentDocument = ORKConsentDocument()
    
    
    

    
    
    @IBAction func tryTap(_ sender: Any) {
        
        
        // Consent Form 
        
        
        consentDocument.title = NSLocalizedString("SB Showcase Consent Form", comment: "")
        
        
        let section1 = ORKConsentSection(type: .overview)
        section1.summary = NSLocalizedString("SB Showcase", comment: "Participation in this study is voluntary")
        section1.content = NSLocalizedString("You have been selected to perform the SB Showcase Study", comment: "")
        
        
        
        let section2 = ORKConsentSection(type: .dataGathering)
        section2.summary = NSLocalizedString("Data Gathering", comment: "")
        section2.content = NSLocalizedString("Various measurements of happiness, preference, and rating of food will be taken into account.", comment: "")
        
        
        let section3 = ORKConsentSection(type: .privacy)
        section3.summary = NSLocalizedString("Confidentiality: Personal Health Information", comment: "")
        section3.content = NSLocalizedString("If you agree to join this study, the doctor and his/her study team will look at your personal health information and collect only the information they need for the study. Personal health information that could be used to identify you includes your name, address, date of birth, and new or existing medical records at this hospital.", comment: "")
        
        
        let section4 = ORKConsentSection()
        
        section4.title = "Customized Title Section"
        section4.summary = NSLocalizedString("Easy to change sections", comment: "")
        section4.content = "With ResearchKit you can add any type of sections with customized wording or images."
       
        
        
        consentDocument.sections = [section1, section2, section3, section4]
        
        
        let signature = ORKConsentSignature(forPersonWithTitle: "Participant", dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        consentDocument.addSignature(signature)
        
        
        let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
        
        let reviewConsentStep = ORKConsentReviewStep(identifier: ConsentReviewStepIdentifier, signature: signature, in: consentDocument)
        
        let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
        passcodeStep.text = "Now you will create a passcode to identifiy yourself to the app and protect access to the information you've entered"
        
        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
        completionStep.title = NSLocalizedString("Welcome aboard.", comment: "")
        completionStep.text = NSLocalizedString("Thank you for joining this study.", comment: "")
        
        
        let fullsteps = [consentStep,reviewConsentStep,passcodeStep,completionStep]
        
        
        let orderedTask = ORKOrderedTask(identifier: "Join", steps: fullsteps)
        
        
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRun: nil)
        taskViewController.delegate = self
        
        present(taskViewController, animated: true, completion: nil)
        

        
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        UIView.appearance().tintColor = UIColor.blue
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
    }
    




}



extension ConsentViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
        
        
        
        
        let result = taskViewController.result
        if let stepResult = result.stepResult(forStepIdentifier: ConsentReviewStepIdentifier),
            let signatureResult = stepResult.results?.first as? ORKConsentSignatureResult {
            signatureResult.apply(to: consentDocument)
            
            consentDocument.makePDF { (data, error) -> Void in
                let tempPath = NSTemporaryDirectory() as NSString
                let path = tempPath.appendingPathComponent("signature.pdf")
                //data?.writeToFile(path, atomically: true)
                
                do {
                    try data?.write(to: URL(fileURLWithPath:path), options: .atomic)
                    
                } catch {
                    
                }
                print(path)
            }}
        
        
        
        
    }
}












