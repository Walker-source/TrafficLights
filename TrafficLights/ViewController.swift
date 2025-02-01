//
//  ViewController.swift
//  TrafficLights
//
//  Created by Denis Lachikhin on 26.01.2025.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var greenView: UIView!
    @IBOutlet private var orangeView: UIView!
    @IBOutlet private var redView: UIView!
    
    @IBOutlet private var switchLightButton: UIButton!
    
    private let trafficLightsStage = (lightIsOff: 0.3, lightIsOn: 1.0)
    private var trafficLightsColorSwitch = TrafficLightColorSwitch.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchLightButton.layer.cornerRadius = 10
        
        greenView.alpha = trafficLightsStage.lightIsOff
        orangeView.alpha = trafficLightsStage.lightIsOff
        redView.alpha = trafficLightsStage.lightIsOff
        
        greenView.layer.cornerRadius = greenView.frame.width / 2
        orangeView.layer.cornerRadius = orangeView.frame.width / 2
        redView.layer.cornerRadius = redView.frame.width / 2
    }

    @IBAction func switchLightButtonDidTapped() {
        if switchLightButton.currentTitle != "Next" {
            switchLightButton.setTitle("NEXT", for: .normal)
        }
        
        switch trafficLightsColorSwitch {
        case .red:
            redView.alpha = trafficLightsStage.lightIsOn
            greenView.alpha = trafficLightsStage.lightIsOff
            trafficLightsColorSwitch = .yellow
        case .yellow:
            redView.alpha = trafficLightsStage.lightIsOff
            orangeView.alpha = trafficLightsStage.lightIsOn
            trafficLightsColorSwitch = .green
        case .green:
            orangeView.alpha = trafficLightsStage.lightIsOff
            greenView.alpha = trafficLightsStage.lightIsOn
            trafficLightsColorSwitch = .red
        }
        
    }
}

//MARK: - Traffic light setup

private extension ViewController {
    enum TrafficLightColorSwitch {
        case red, yellow, green
    }
}
