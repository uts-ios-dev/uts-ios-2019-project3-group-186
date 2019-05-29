//
//  ChoiceController.swift
//  project-just-another-day
//
//  Created by Yuen Lau on 29/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation


class ChoiceController {
    
    
    var currentTime:Int
    var currentScore:Int
    
    
    
    init() {
        currentTime = 700
        currentScore = 0
        print(getCurrentTime())
        updateTime(addMinutes: 100)
        print(getCurrentTime())
    }

    func updateTime(addMinutes: Int){
        var addtime = addMinutes
        if (addMinutes > 60){
            addtime = (addMinutes/60 * 100) + addMinutes % 60
        }
        currentTime = currentTime + addtime
        
    }
    
    func getCurrentTime() -> String{
        var hours = currentTime/100
        let tenMinutes = (currentTime/10)%10
        let minutes = currentTime%10
        let amOrPm: String = hours < 12 ? " AM" : " PM"
        hours = hours % 12
        let time: String  = String(hours) + ":" + String(tenMinutes)+String(minutes) + amOrPm
        
        return time
    }
    
    
}
