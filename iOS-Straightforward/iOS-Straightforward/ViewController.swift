//
//  ViewController.swift
//  iOS-Straightforward
//
//  Created by Sung Min Kim on 11/15/23.
//

import UIKit
import IncdOnboarding

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startOnboardingBtn(_ sender: UIButton) {
        startOnboarding()
    }
    
    fileprivate func createSessionConfiguration() -> IncdOnboardingSessionConfiguration {
        return IncdOnboardingSessionConfiguration(regionCode: "ALL", configurationId: "64cc493c9ffb985de6c56053")
    }
    
    fileprivate func createFlowConfiguration() -> IncdOnboardingFlowConfiguration {
        let flowConfig = IncdOnboardingFlowConfiguration(waitForTutorials: true)
        flowConfig.addIdScan()
        flowConfig.addSelfieScan()
        flowConfig.addFaceMatch()
        return flowConfig
    }
    
    fileprivate func startOnboarding() {
        let sessionConfig = createSessionConfiguration()
        let flowConfig = createFlowConfiguration()
        IncdOnboardingManager.shared.presentingViewController = self
        IncdOnboardingManager.shared.startOnboarding(sessionConfig: sessionConfig, flowConfig: flowConfig, delegate: self)
    }
}

extension ViewController: IncdOnboardingDelegate {
    func onOnboardingSessionCreated(_ result: OnboardingSessionResult) {
        print("onOnboardingSessionCreated: \(result)")
    }
    
    func onIdFrontCompleted(_ result: IdScanResult) {
        print("onIdFrontCompleted: \(result)")
    }
    
    func onIdBackCompleted(_ result: IdScanResult) {
        print("onIdBackCompleted: \(result)")
    }
    
    func onIdProcessed(_ result: IdProcessResult) {
        print("onIdProcessed: \(result)")
    }
    
    func onSelfieScanCompleted(_ result: SelfieScanResult) {
        print("onSelfieScanCompleted: \(result)")
    }
    
    func onFaceMatchCompleted(_ result: FaceMatchResult) {
        print("onFaceMatchCompleted: \(result)")
    }
    
    func onEvents(_ eventsWithDetails: [EventWithDetails]) {
        print(eventsWithDetails.first)
    }
    
    func userCancelledSession() {
        print("userCancelledSession")
    }
    
    func onError(_ error: IncdFlowError) {
        print("onError: \(error.description)")
    }
    
    func onSuccess() {
        print("onSuccess")
    }
}
