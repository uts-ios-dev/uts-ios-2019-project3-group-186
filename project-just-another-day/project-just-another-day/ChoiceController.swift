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
    }
    
    func updateTime(addMinutes: Int){
        let minutes = currentTime%100
        var addMinutes = minutes + addMinutes
        if (addMinutes >= 60){
            addMinutes = (addMinutes/60 * 100) + addMinutes % 60
        }
        let hours = currentTime - minutes
        currentTime = hours + addMinutes
    }
    
    func getCurrentTime() -> String {
        var hours = currentTime/100
        let tenMinutes = (currentTime/10)%10
        let minutes = currentTime%10
        let amOrPm: String = hours < 12 ? " AM" : " PM"
        hours = hours % 12
        if hours == 0 {
            hours = 12
        }
        let time: String  = String(hours) + ":" + String(tenMinutes)+String(minutes) + amOrPm
        
        return time
    }
    
    func getTimeRaw()-> Int { return currentTime }
    func setTimeRaw(time :Int) { currentTime = time }
    
    
}
