//
//  ViewController.swift
//  TrafficLights
//
//  Created by Denis Lachikhin on 26.01.2025.
//

import UIKit

final class ViewController: UIViewController {
//MARK: - IB Outlets
    @IBOutlet private var greenView: UIView!
    @IBOutlet private var orangeView: UIView!
    @IBOutlet private var redView: UIView!
    
    @IBOutlet private var switchLightButton: UIButton!
    @IBOutlet private var resetButton: UIButton!
    
//    MARK: - Private Properties
    private var halfSideView: CGFloat {
        redView.frame.width / 2
    }
    
    private let trafficLightsStage = (lightIsOff: 0.3, lightIsOn: 1.0)
    private var trafficLightsColorSwitch = TrafficLightColorSwitch.red
    private var redOrGreen = TrafficLightColorSwitch.green
    
//    MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        switchLightButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
        
        greenView.alpha = trafficLightsStage.lightIsOff
        orangeView.alpha = trafficLightsStage.lightIsOff
        redView.alpha = trafficLightsStage.lightIsOff
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = halfSideView
        orangeView.layer.cornerRadius = halfSideView
        greenView.layer.cornerRadius = halfSideView
    }

//    MARK: - IB Actions
    @IBAction func resetButtonDidTapped(_ sender: UIButton) {
        switchLightButton.setTitle("START", for: .normal)
        
        trafficLightsColorSwitch = .red
        
        greenView.alpha = trafficLightsStage.lightIsOff
        redView.alpha = trafficLightsStage.lightIsOff
        orangeView.alpha = trafficLightsStage.lightIsOff
    }
    
    @IBAction func switchLightButtonDidTapped() {
        if switchLightButton.currentTitle != "Next" {
            switchLightButton.setTitle("NEXT", for: .normal)
        }
        
        switch trafficLightsColorSwitch {
        case .red:
            redView.alpha = trafficLightsStage.lightIsOn
            orangeView.alpha = trafficLightsStage.lightIsOff
            trafficLightsColorSwitch = .yellow
            redOrGreen = .green
        case .yellow:
            if redOrGreen == .green {
                redView.alpha = trafficLightsStage.lightIsOff
                orangeView.alpha = trafficLightsStage.lightIsOn
                trafficLightsColorSwitch = .green
            } else {
                greenView.alpha = trafficLightsStage.lightIsOff
                orangeView.alpha = trafficLightsStage.lightIsOn
                trafficLightsColorSwitch = .red
            }
        case .green:
            orangeView.alpha = trafficLightsStage.lightIsOff
            greenView.alpha = trafficLightsStage.lightIsOn
            trafficLightsColorSwitch = .yellow
            redOrGreen = .red
        }
        
    }
}

//MARK: - TrafficLightColorSwitch

private extension ViewController {
    enum TrafficLightColorSwitch {
        case red, yellow, green
    }
}
