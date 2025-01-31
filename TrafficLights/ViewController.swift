//
//  ViewController.swift
//  TrafficLights
//
//  Created by Denis Lachikhin on 26.01.2025.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var greenLightView: UIView!
    @IBOutlet private var orangeLightView: UIView!
    @IBOutlet private var redLightView: UIView!
    @IBOutlet private var startButton: UIButton!
    
    private let trafficLightsStage = (lightIsOff: 0.3, lightIsOn: 1.0)
    private var trafficLightsSwitch = TrafficLightColorSwitch.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        
        greenLightView.alpha = trafficLightsStage.lightIsOff
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        
        orangeLightView.alpha = trafficLightsStage.lightIsOff
        orangeLightView.layer.cornerRadius = orangeLightView.frame.width / 2
        
        redLightView.alpha = trafficLightsStage.lightIsOff
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        
//        redLightView.alpha = trafficLightsSetting.lightOff
//        redLightView.layer.cornerRadius = redLightView.frame.size.height/2
//        orangeLightView.alpha = trafficLightsSetting.lightOff
//        orangeLightView.layer.cornerRadius = orangeLightView.frame.size.height/2
//        greenLightView.alpha = trafficLightsSetting.lightOff
//        greenLightView.layer.cornerRadius = greenLightView.frame.size.height/2
    }

    @IBAction func startButtonDidTapped() {
//        if !startButton.currentTitle?.contains("Next") {
            
        }
//        startButton.setTitle("NEXT", for: .normal)
        
//        switch trafficLightsStage {
//        case 1:
//            redLightView.alpha = trafficLightsSetting.lightOn
//            greenLightView.alpha = trafficLightsSetting.lightOff
//            trafficLightsStage = 2
//        case 2:
//            redLightView.alpha = trafficLightsSetting.lightOff
//            orangeLightView.alpha = trafficLightsSetting.lightOn
//            trafficLightsStage = 3
//        case 3:
//            orangeLightView.alpha = trafficLightsSetting.lightOff
//            greenLightView.alpha = trafficLightsSetting.lightOn
//            trafficLightsStage = 1
//        default:
//            redLightView.alpha = trafficLightsSetting.lightOff
//            orangeLightView.alpha = trafficLightsSetting.lightOff
//            greenLightView.alpha = trafficLightsSetting.lightOff
//            
//        }
        
    }
}

//MARK: - Traffic light setup

private extension ViewController {
    enum TrafficLightColorSwitch {
        case red, yellow, green
    }
}
