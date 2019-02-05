//
//  InfoController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit
import MapKit

let bodyFontSize = CGFloat(15)

class InfoController: UIViewController, UITextFieldDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		self.title = thingsToDo[selected].toString(shortMonth: false, includeDay: false, includeYear: false)
		
		let scrollView = UIScrollView(frame: self.view.bounds)
		scrollView.contentSize = self.view.bounds.size
		scrollView.contentSize.height = self.view.bounds.size.height
		
		var yPos = 20 // position tasks will be displayed at on y-axis
		
		let thoughtTitle = UILabel()
		thoughtTitle.text = "Notes"
		thoughtTitle.font = UIFont.systemFont(ofSize: 28, weight: .bold)
		thoughtTitle.frame = CGRect(x: 15, y: yPos, width:250, height: 40)
		scrollView.addSubview(thoughtTitle)
		yPos += 40
		
		let thoughtText = UITextView()
		thoughtText.text = thingsToDo[selected].thoughts
		thoughtText.font = UIFont.systemFont(ofSize: 15)
		// want to make this a constraint; not a static height
		thoughtText.frame = CGRect(x: 12, y: yPos, width: Int(UIScreen.main.bounds.width)-30, height: 150)
		thoughtText.textAlignment = .left
		scrollView.addSubview(thoughtText)
		yPos += Int(thoughtText.frame.height) - 40
		
		if (thingsToDo[selected].tasks.count > 0) {
			let taskTitle = UILabel()
			taskTitle.text = "Tasks"
			taskTitle.font = UIFont.systemFont(ofSize: 28, weight: .bold)
			taskTitle.frame = CGRect(x: 15, y: yPos, width:250, height: 40)
			scrollView.addSubview(taskTitle)
			
			yPos += 50
			
			for task in thingsToDo[selected].tasks {
				// task checkbox
				var checkBox = UIImage(named: "circle@60")
				if (task.check) {
					checkBox = UIImage(named: "checkFilled@60")
				}
				let checkBtn = CheckUIButton(belongsTo: task)
				checkBtn.frame = CGRect.init(x: 20, y: yPos, width: 30, height: 30)
				checkBtn.setImage(checkBox, for: .normal)
				checkBtn.addTarget(self, action: #selector(self.changeCheck(_:)), for: .touchUpInside)
				scrollView.addSubview(checkBtn)
	
				// task label
				let taskField = UITextView() // should disable editing
				taskField.returnKeyType = .done
				taskField.text = task.description
				taskField.font = UIFont.systemFont(ofSize: bodyFontSize)
				taskField.textAlignment = .left
				taskField.frame = CGRect(x: 60, y: yPos-3, width: 280, height: 40)
				taskField.sizeToFit()
				taskField.isScrollEnabled = false
				yPos += Int(taskField.frame.height)
				scrollView.addSubview(taskField)
			}
			
			var newTask = Task(description: "")
			let newTaskField = UITextField() // should disable editing
			newTaskField.returnKeyType = .done
			newTaskField.placeholder = "New task..."
			newTaskField.font = UIFont.systemFont(ofSize: bodyFontSize)
			newTaskField.textColor = UIColor.black
			newTaskField.textAlignment = .left
			newTaskField.frame = CGRect(x: 65, y: yPos-5, width: 280, height: 40)
			// newTaskField.addTarget(self, action: #selector(self.addNewItem(_:)), for: .touchUpInside)
			// cannot do the above, need to find a roundabout way
			scrollView.addSubview(newTaskField)
			
			let checkBtn = CheckUIButton(belongsTo: newTask)
			checkBtn.frame = CGRect.init(x: 20, y: yPos, width: 30, height: 30)
			checkBtn.setImage(UIImage(named: "circle@60"), for: .normal)
			checkBtn.addTarget(self, action: #selector(self.changeCheck(_:)), for: .touchUpInside)
			scrollView.addSubview(checkBtn)
			
			yPos += 20 // padding between tasks and next item
			
			// MAPS
			let map = MKMapView()
			map.frame = CGRect(x: 0, y: yPos, width: Int(UIScreen.main.bounds.width), height: 400)
			map.setCenter(CLLocationCoordinate2D(latitude: -33.63, longitude: 150.66), animated: true)
			map.showsUserLocation = true
			// scrollView.addSubview(map)
			self.view.addSubview(scrollView)
		} else {
			// insert empty check box that we can add a task to
		}
    }
	
	@objc func changeCheck(_ sender: CheckUIButton!) {
		sender.belongsTo.check.toggle()
		var checkImage: UIImage
		if (sender.belongsTo.check) {
			checkImage = UIImage(named: "checkFilled@60")!
		} else {
			checkImage = UIImage(named: "circle@60")!
		}
		sender.setImage(checkImage, for: .normal)
	}
	
	@objc func addNewItem(_ sender: UITextField!) {
		// sender.belongsTo.check = false
		print("PRESSED!!!!")
		sender.backgroundColor = .blue
	}
	
	// without this, pressing done will not hide the keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
	}
	
	func addToDo(item: Task, TaskSet: [Task]) -> [Task] {
		var TaskSet = TaskSet
		TaskSet.append(item)
		return TaskSet
	}
	
	func showTasks(tasks: [Task], yPos: Int) {
		
	}
}

// use this subclass, otherwise cannot access what task the checkBtn is for
class CheckUIButton: UIButton {
	var belongsTo: Task
	
	init(belongsTo: Task) {
		self.belongsTo = belongsTo
		super.init(frame: .zero)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
