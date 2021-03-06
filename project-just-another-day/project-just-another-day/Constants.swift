//
//  Constants.swift
//  project-just-another-day
//
//  Created by Alex Au on 27/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation
import AVFoundation

//This "Constants" file holds the constants referred to for each scene

//Background images for each scene
struct Background {
    static let MORNING_BEDROOM = "BEDROOM"
    static let CLASSROOM = "CLASSROOM"
    static let LIVING_ROOM = "LIVING_ROOM"
    static let STUDY_ROOM = "STUDYROOM"
}

//Each interactable for each scene
struct Interactable {
    static let MAINMENU = "mainmenubg"
    static let SCENARIO = "scenario"
    static let RESULTS = "r"

    //Morning
    static let BACKPACK = "backpack"
    static let MORNING_ALARM = "morningAlarm"
    static let MORNING_PHONE = "phone"
    //School
    static let BLACKBOARD = "blackboard"
    static let CLASSROOM_DOOR = "classroomDoor"
    static let CLASSROOM_PHONE = "classroomPhone"
    static let CLASSROOM_TEXTBOOK = "classroomTextbook"
    static let CLASSROOM_SNACKS = "classroomSnacks"
    static let FRIEND = "friend"
    static let TEACHER = "teacher"
    //Afternoon
    static let KITCHEN_TABLE = "kitchenTable"
    static let LIVING_ROOM_DOOR = "livingRoomDoor"
    static let LIVING_ROOM_TEXTBOOK = "livingRoomTextbook"
    static let SOFA = "sofa"
    static let SPORT_EQUIPMENT = "sportEquipment"
    //Night
    static let BED = "bed"
    static let LAPTOP = "laptop"
    static let NIGHT_BACKPACK = "nightBackpack"
    static let NIGHT_TELEVISION = "nightTelevision"
    static let NIGHT_TEXTBOOK = "nightTextbook"
}

//Each scene in the application
struct Scene {
    static let MAIN_MENU = "MainMenu"
    static let SCENARIO_MENU = "ScenarioMenu"
    static let PRELUDE_SCENE = "Prelude"
    static let MORNING_SCENE = "Morning"
    static let CLASS_SCENE = "Class"
    static let AFTERNOON_SCENE = "Afternoon"
    static let NIGHT_SCENE = "Night"
    static let RESULT_SCENE = "Result"
    
}

//Label within each skscene
struct Label {
    static let TIME = "//timeLabel"
    static let TITLE = "title"
    static let ACTION = "//actionNotifier"
    static let FEEDBACK = "feedback"
}

//Font used
struct Font {
    static let CLOCK_FONT = "digital-7.ttf"
}

//Scenario scene - available scenarios for gameplay
struct Scenario {
    static let TIME_MANAGEMENT = "timeManagement"
    static let COURTESY = "courtesy"
}

//Morning Scene - Alarm choices
struct Alarm {
    static let CHOICE = "//morningAlarmChoice"
    static let SNOOZE = "//snooze"
    static let TURN_ALARM_OFF = "//turnAlarmOff"
}

//Many scenes with phone choices for each scene
struct Phone {
    static let CHOICE = "//phoneChoice"
    static let CHECK_TIMETABLE = "//checkTimetable"
    static let SNAPCHAT = "//snapchat"
    static let WATCH_YOUTUBE = "//watchYoutube"
    static let ONLINE_CALCULATOR = "//onlineCalculator"
}

//Night scene - Bed choices
struct Bed {
    static let CHOICE = "//bedChoice"
    static let NAP = "//nap"
    static let SLEEP = "//sleep"
}

//Afternoon scene - Sofa choices
struct Sofa {
    static let CHOICE = "//sofaChoice"
    static let NAP = "//nap"
    static let SLEEP = "//sleep"
}

//Classroom scene & Afternoon scene - Door choices
struct Door {
    static let CHOICE = "//doorChoice"
    static let TOILET_BREAK = "//toiletBreak"
    static let CANTEEN = "//goCanteen"
    static let MACCAS_RUN = "//maccasRun"
    static let HANGOUT = "//hangout"
}

//Night scene - Laptop choices
struct Laptop {
    static let CHOICE = "//laptopChoice"
    static let WATCH_YOUTUBE = "//watchYoutube"
    static let STUDY = "//study"
}

//Button interactions
struct Button {
    static let MENU_START_BUTTON = "menuStartButton"
    static let MENU_EXIT_BUTTON = "menuExitButton"
    static let START_BUTTON = "startButton"
    static let MAIN_MENU_BUTTON = "mainMenuButton"
    static let BACK_TO_MAIN_MENU_BUTTON = "backToMainMenuButton"
    static let BACK_TO_SCENARIO_MENU_BUTTON = "backToScenarioMenuButton"
}

//Atlas' for each animations
struct SpriteAtlas {
    //Animated interactables
    static let ALARM = "alarm"
    static let PHONE = "phone"
    static let BACKPACK = "backpack"
    static let CLASSROOM_DOOR = "classroomdoor"
    static let CLASSROOM_SNACKS = "snack"
    static let CLASSROOM_TEXTBOOK = "textbook"
    static let BLACKBOARD = "blackboard"
    static let TEACHER = "teacher"
    static let FRIEND = "pencilcase"
    static let BASKETBALL = "basketball"
    static let SOFA = "couch"
    static let FOOD = "food"
    static let FRONT_DOOR = "frontdoor"
    static let TELEVISION = "Tvlivingroom"
    static let BED = "bed"
    static let LAPTOP = "laptop"
    static let TV_BED = "tvbed"
    
    //Animated backdrops
    static let MAINMENU = "mainmenubg"
    static let SCENARIO = "scenario"
    static let RESULTS = "r"

}

//Gameplay scenes number allocation
struct SceneNumber {
    static let MORNING = 0
    static let CLASS = 1
    static let AFTERNOON = 2
    static let NIGHT = 3
}

//Switch between different gameplay audios
struct AudioNams {
    static let mainmenuNm = "music1"
    static let resultNm = "music2"
    static let ButtonNm = "ButtonTap"
}
