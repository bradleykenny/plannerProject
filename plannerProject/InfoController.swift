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
		
		if (thingsToDo[selected].tasks.count > 0) {
			var yPos = 250
			let taskTitle = UILabel()
			taskTitle.text = "Tasks"
			taskTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
			taskTitle.frame = CGRect(x: 15, y: yPos, width:250, height: 40)
			yPos += 40
			self.view.addSubview(taskTitle)
			
			for task in thingsToDo[selected].tasks {
				// task checkbox
				var checkBox = UIImage(named: "check@40")
				if (task.check) {
					checkBox = UIImage(named: "checkFilled@40")
				}
				let checkBoxImageView = UIImageView(image: checkBox)
				checkBoxImageView.frame = CGRect(x: 20, y: yPos+10, width: 20, height: 20)
				self.view.addSubview(checkBoxImageView)
				checkBoxImageView.isUserInteractionEnabled = true
				
				// task label
				let taskLabel = UILabel()
				taskLabel.text = task.description
				taskLabel.font = UIFont.systemFont(ofSize: 16)
				taskLabel.textAlignment = .left
				taskLabel.frame = CGRect(x: 50, y: yPos, width:250, height: 40)
				yPos += 30
				self.view.addSubview(taskLabel)
				
				// TODO: implement some way of recognising taps and
				//       changing the images to reflect state of task
			}
 		}
    }
	
	override func viewDidAppear(_ animated: Bool) {
		// this won't work?
		thingsToDo[selected].thoughts = thoughtBox.text
	}
}
