//
//  ChoiceController.swift
//  project-just-another-day
//
//  Created by Yuen Lau on 29/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import SpriteKit

//This class is designed for the interactables that have a choice option, handling the scores and displays.
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

    //This function handles adding the points to each specific choice interaction and adjust the points
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
    
    //This function counts the number of interactions with a specific choice
    func countAction(objectName: String)->Int{
        var count : Int = 0
        for i in actions {
            if  i == objectName {
                count += 1
            }
        }
        return count
    }
    
    //This function handles the time (top right) being updated
    func updateTime(addMinutes: Int){
        let minutes = currentTime % 100
        var addMinutes = minutes + addMinutes
        if (addMinutes >= 60){
            addMinutes = (addMinutes / 60 * 100) + addMinutes % 60
        }
        let hours = currentTime - minutes
        currentTime = hours + addMinutes
    }
    
    //This fuction handles displaying the time in 12hr format
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
    
    //This function handles grabbing the score the player achieved during the gameplay
    func getScore()->[Int]{
        points[SceneNumber.MORNING] = points[SceneNumber.MORNING] < 10 ? points[SceneNumber.MORNING] : 10
        points[SceneNumber.CLASS] = points[SceneNumber.CLASS] < 50 ? points[SceneNumber.CLASS] : 50
        points[SceneNumber.AFTERNOON] = points[SceneNumber.AFTERNOON] < 10 ? points[SceneNumber.AFTERNOON] : 10
        points[SceneNumber.NIGHT] = points[SceneNumber.NIGHT] < 30 ? points[SceneNumber.NIGHT] : 30
        
        return points
    }
    
    //This function handles attaining the points from each scene
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
    
    //This function updates the animation (fade) of the action/choice notifier label for all scenes
    func updateAction(_ labelNode: SKLabelNode, message: String) {
        labelNode.removeAllActions()
        labelNode.alpha = 1.0
        labelNode.text = message
        labelNode.isHidden = false
        labelNode.fontSize = 50
        let wait = SKAction.wait(forDuration: 3)
        let fade = SKAction.fadeOut(withDuration: 3)
        let sequence = SKAction.sequence([wait, fade])
        labelNode.run(sequence)
    }
    
    //This function hides and unhides the pop-up UI for interactables if they have a choice
    func hideChoice(_ popUp: SKSpriteNode, _ firstChoice: SKLabelNode, _ secondChoice: SKLabelNode, _ hide: Bool) {
        popUp.isHidden = hide
        firstChoice.isHidden = hide
        secondChoice.isHidden = hide
    }
}
