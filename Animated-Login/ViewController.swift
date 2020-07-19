//
//  ViewController.swift
//  Animated Login
//
//  Created by Lourenço Viguini Werneck on 05/05/20.
//  Copyright © 2020 Lourenço Viguini Werneck. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    let animationView = AnimationView()
    var lastFrame = 0.0
    var lastPasswordLength = 0
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimation()
        
    }
    
    private func setupAnimation() {
        animationView.animation = Animation.named("animation")
        animationView.frame = CGRect(x: 0, y: 0, width: 414, height: 414)
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        print(UIScreen.main.bounds)
    }
    @IBAction func nameChanged(_ sender: UITextField) {
        
        let textLength = sender.text?.count ?? 0
        let currentFrame = (Double(textLength) - 1.0) *  2.0 + 20
        if textLength <= 25 {
            animationView.play(fromFrame: AnimationFrameTime(lastFrame), toFrame: AnimationFrameTime(currentFrame))
            print("lastFram: \(lastFrame), currentFrame: \(currentFrame)")
            lastFrame = currentFrame
        }
    }
    
    @IBAction func passWordChanged(_ sender: UITextField) {
        
        if sender.text?.count == 1 && lastPasswordLength == 0 {
            animationView.play(fromFrame: AnimationFrameTime(95), toFrame: AnimationFrameTime(105))
        }
        if sender.text?.count == 0 {
            animationView.play(fromFrame: AnimationFrameTime(105), toFrame: AnimationFrameTime(95))
        }
        lastPasswordLength = sender.text?.count ?? 0
    }
    @IBAction func beginEditing(_ sender: UITextField) {
        animationView.play(fromFrame: AnimationFrameTime(70), toFrame: AnimationFrameTime(90))
    }
}

