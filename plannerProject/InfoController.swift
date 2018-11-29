//
//  InfoController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

class InfoController: UIViewController {
	
	@IBOutlet weak var descriptionBox: UITextView!
	@IBOutlet weak var thoughtBox: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		self.title = thingsToDo[selected].toString(shortMonth: false, includeDay: false, includeYear: false)
		
		descriptionBox.isEditable = false
		thoughtBox.isEditable = false
	
		if (thingsToDo[selected].title != "") {
			descriptionBox.text = thingsToDo[selected].title
		}
    }
	
	override func viewDidAppear(_ animated: Bool) {
		// this won't work?
		thingsToDo[selected].thoughts = thoughtBox.text
	}
}
