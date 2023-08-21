//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
   

   
    
    @IBOutlet weak var bar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    
    
    var second = 0
    var timer = Timer()
    var totalTime = 0
    var player: AVAudioPlayer!
    
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
      
     
        timer.invalidate()
        let eggTimes : [String:Int] = ["Soft": 3 ,"Medium": 4,"Hard": 5]
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:  #selector(updateTimer), userInfo: nil, repeats: true)
        bar.progress = 0.0
        second = 0
        label.text = hardness
            
        
    }
        @objc func updateTimer()
        {
            second += 1
            
            if second <= totalTime
            {
                let kalan = Float(second) / Float(totalTime)
                bar.progress = kalan
                
               
                if second == totalTime {
                    
                        label.text = "Bitti"
                    second += 1
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                                player = try! AVAudioPlayer(contentsOf: url!)
                                player.play()
                }
               
                
            }
            else
            {
                timer.invalidate()
            }
        }
 
        
    
}
