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
				var checkBox = UIImage(named: "check@60")
				if (task.check) {
					checkBox = UIImage(named: "checkFilled@60")
				}
				
				// TEST CODE
				var something = UIButton()
				something.frame = CGRect.init(x: 150, y: yPos, width: 30, height: 30)
				something.setImage(checkBox, for: .normal)
				self.view.addSubview(something)
				// END TEST CODE
				
				let checkBoxImageView = UIImageView(image: checkBox)
				if (task.check) {
					checkBoxImageView.image = checkBoxImageView.image?.withRenderingMode(.alwaysTemplate)
					checkBoxImageView.tintColor = UIColor(red: 105/255, green: 197/255, blue: 60/255, alpha: 1.0)
				}
				checkBoxImageView.frame = CGRect(x: 20, y: yPos, width: 30, height: 30)
				self.view.addSubview(checkBoxImageView)
				checkBoxImageView.isUserInteractionEnabled = true
				
				// task label
				let taskField = UITextField()
				taskField.returnKeyType = .done
				taskField.text = task.description
				taskField.font = UIFont.systemFont(ofSize: 16)
				taskField.textAlignment = .left
				taskField.frame = CGRect(x: 60, y: yPos-5, width:250, height: 40)
				yPos += 35
				self.view.addSubview(taskField)
				
				
				
				// TODO: implement some way of recognising taps and
				//       changing the images to reflect state of task
			}
 		}
    }
	
	override func viewDidAppear(_ animated: Bool) {
		// this won't work?
		thingsToDo[selected].thoughts = thoughtBox.text
	}
	
	// without this, pressing done will not hide the keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		print("Should be closing")
		self.view.endEditing(true)
		return false
	}
}
