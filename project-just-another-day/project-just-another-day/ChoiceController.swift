//
//  ChoiceController.swift
//  project-just-another-day
//
//  Created by Yuen Lau on 29/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

class ChoiceController {
    
    private var currentTime: Int
    private var currentScore: Int
    private var actions: [String]
    private var points: [Int]
    private var feedback: String
    
    init() {
        currentTime = 700
        currentScore = 0
        actions = []
        points = [0, 0, 0, 0]
        feedback = ""
    }
    
    func addPoints(numberOfPoints: Int, sceneNumber: Int, object: String){
        var pointsToAdd = numberOfPoints
        var  times = countAction(objectName: object)
        while times != 0 {
            pointsToAdd = pointsToAdd / 2
            times = times - 1
        }
        points[sceneNumber] += pointsToAdd
        actions.append(object)
    }
    
    func countAction(objectName: String)->Int{
        var count : Int = 0
        for i in actions {
            if  i == objectName {
                count += 1
            }
        }
        return count
    }
    
    func updateTime(addMinutes: Int){
        let minutes = currentTime % 100
        var addMinutes = minutes + addMinutes
        if (addMinutes >= 60){
            addMinutes = (addMinutes / 60 * 100) + addMinutes % 60
        }
        let hours = currentTime - minutes
        currentTime = hours + addMinutes
    }
    
    func getCurrentTime() -> String {
        var hours = currentTime / 100
        let tenMinutes = (currentTime / 10) % 10
        let minutes = currentTime % 10
        let amOrPm: String = hours < 12 ? " AM" : " PM"
        hours = hours % 12
        if hours == 0 { hours = 12 }
        let time: String  = String(hours) + ":" + String(tenMinutes)+String(minutes) + amOrPm
        
        return time
    }
    func getScore()->[Int]{
        points[SceneNumber.MORNING] = points[SceneNumber.MORNING] < 10 ? points[SceneNumber.MORNING] : 10
        points[SceneNumber.CLASS] = points[SceneNumber.CLASS] < 50 ? points[SceneNumber.CLASS] : 50
        points[SceneNumber.AFTERNOON] = points[SceneNumber.AFTERNOON] < 10 ? points[SceneNumber.AFTERNOON] : 10
        points[SceneNumber.NIGHT] = points[SceneNumber.NIGHT] < 30 ? points[SceneNumber.NIGHT] : 30
        
        return points
    }
    func getPoints(sceneNumber: Int)->Int {
        return points[sceneNumber]
    }
    
    func addFeedback(_ text: String) {
        feedback.append(text)
    }
    
    func getFeedback()->String { return feedback }
    
    func getTimeRaw()-> Int { return currentTime }
    
    func setTimeRaw(time :Int) {
        currentTime = time
        actions = []
    }
    
    func updateAction(_ labelNode: SKLabelNode, message: String) {
        labelNode.alpha = 1.0
        labelNode.text = message
        labelNode.isHidden = false
        labelNode.run(SKAction.fadeOut(withDuration: 4))
    }
}
