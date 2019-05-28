//
//  Choice.swift
//  project-just-another-day
//
//  Created by Alex Au on 28/5/19.
//  Copyright © 2019 Group-168. All rights reserved.
//

import Foundation

enum Choice {
    case Morning
    case Class
    case Afternoon
    case Night
    
    var chosenOption: String {
        switch self {
        case .Morning:
            return ""
        case .Class:
            return ""
        case .Afternoon:
            return ""
        case .Night:
            return ""
        }
    }
}
