//
//  ViewController.swift
//  TrafficLights
//
//  Created by Denis Lachikhin on 26.01.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var greenLightView: UIView!
    @IBOutlet var orangeLightView: UIView!
    @IBOutlet var redLightView: UIView!
    @IBOutlet var startButton: UIButton!
    
    private let trafficLightsSetting = (lightOff: 0.3, lightOn: 1.0)
    private var trafficLightsStage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        redLightView.alpha = trafficLightsSetting.lightOff
        redLightView.layer.cornerRadius = redLightView.frame.size.height/2
        orangeLightView.alpha = trafficLightsSetting.lightOff
        orangeLightView.layer.cornerRadius = orangeLightView.frame.size.height/2
        greenLightView.alpha = trafficLightsSetting.lightOff
        greenLightView.layer.cornerRadius = greenLightView.frame.size.height/2
    }

    @IBAction func startButtonDidTapped() {
    
        startButton.setTitle("NEXT", for: .normal)
        
        switch trafficLightsStage {
        case 1:
            redLightView.alpha = trafficLightsSetting.lightOn
            greenLightView.alpha = trafficLightsSetting.lightOff
            trafficLightsStage = 2
        case 2:
            redLightView.alpha = trafficLightsSetting.lightOff
            orangeLightView.alpha = trafficLightsSetting.lightOn
            trafficLightsStage = 3
        case 3:
            orangeLightView.alpha = trafficLightsSetting.lightOff
            greenLightView.alpha = trafficLightsSetting.lightOn
            trafficLightsStage = 1
        default:
            redLightView.alpha = trafficLightsSetting.lightOff
            orangeLightView.alpha = trafficLightsSetting.lightOff
            greenLightView.alpha = trafficLightsSetting.lightOff
            
        }
        
    }
}

