//
//  InfoController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

class InfoController: UIViewController, UITextFieldDelegate {

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
			var yPos = 250 // position tasks will be displayed at on y-axis
			let taskTitle = UILabel()
			taskTitle.text = "Tasks"
			taskTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
			taskTitle.frame = CGRect(x: 15, y: yPos, width:250, height: 40)
			self.view.addSubview(taskTitle)
			
			yPos += 50
			
			for task in thingsToDo[selected].tasks {
				// task checkbox
				var checkBox = UIImage(named: "check@60")
				if (task.check) {
					checkBox = UIImage(named: "checkFilled@60")
				}
				let checkBtn = CheckUIButton(taskFor: task)
				checkBtn.frame = CGRect.init(x: 20, y: yPos, width: 30, height: 30)
				checkBtn.setImage(checkBox, for: .normal)
				checkBtn.addTarget(self, action: #selector(self.changeCheck(_:)), for: .touchUpInside)
				self.view.addSubview(checkBtn)
	
				// task label
				let taskField = UITextField()
				taskField.returnKeyType = .done
				taskField.text = task.description
				taskField.font = UIFont.systemFont(ofSize: 16)
				taskField.textAlignment = .left
				taskField.frame = CGRect(x: 60, y: yPos-5, width:250, height: 40)
				taskField.delegate = self
				yPos += 35
				self.view.addSubview(taskField)
			}
 		}
    }
	
	@objc func changeCheck(_ sender: CheckUIButton!) {
		sender.taskFor.check.toggle()
		var checkImage: UIImage
		if (sender.taskFor.check) {
			checkImage = UIImage(named: "checkFilled@60")!
		} else {
			checkImage = UIImage(named: "check@60")!
		}
		sender.setImage(checkImage, for: .normal)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		// this won't work?
		thingsToDo[selected].thoughts = thoughtBox.text
	}
	
	// without this, pressing done will not hide the keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
	}
}

// use this subclass, otherwise cannot access what task the checkBtn is for
class CheckUIButton: UIButton {
	var taskFor: Task
	
	init(taskFor: Task) {
		self.taskFor = taskFor
		super.init(frame: .zero)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
