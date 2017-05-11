//
//  Note.swift
//  apr20NoteTakingApp
//
//  Created by Roxanne Farkas on 5/4/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import Foundation

class Note {
    var title: String
    var complete: Bool

    init(title: String) {
        self.title = title
        self.complete = false
    }
}
