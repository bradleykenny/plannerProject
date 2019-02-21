//
//  addController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

class addController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var input1: UITextField!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var datePicker: UIDatePicker!
	@IBOutlet weak var showDateButton: UIButton!
	let somethingn = UITextField()
	
	let formatter = DateFormatter()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "New Plan"
		
		let color = UIColor(red: 60/255, green: 172/255, blue: 255/255, alpha: 1.0)

		input1.borderStyle = UITextField.BorderStyle.none
		
		// indents text in textfield
		let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:0))
		input1.leftViewMode = UITextField.ViewMode.always
		input1.leftView = spacerView
		self.input1.delegate = self

		// change background color in here
		addButton.backgroundColor = color
		addButton.setTitleColor(UIColor.white, for: .normal)
		
		// add date button
		formatter.dateFormat = "EEEE, dd MMMM, yyyy"
		showDateButton.setTitle(formatter.string(from: datePicker.date), for: .normal)
		showDateButton.layer.cornerRadius = 5.0
		showDateButton.layer.backgroundColor = color.cgColor
		
		// datePicker set-up
		datePicker?.datePickerMode = UIDatePicker.Mode.date
		datePicker.isHidden = true
		
		// agenda description
		somethingn.frame = CGRect(x: 20, y: datePicker.frame.minY, width: view.frame.width-30, height: 100)
		somethingn.placeholder = "Description"
		view.addSubview(somethingn)
    }
	
	@IBAction func addToArray(_ sender: Any) {
		if (input1.text != "") {
			let temp = ToDoController()
			if (!temp.compareDatesToArr(arr: thingsToDo, date: datePicker.date)) {
				let newItem = Agenda(date: datePicker.date, title: input1.text!)
				// TODO: get newItem somethingn text
				thingsToDo.append(newItem)
				thingsToDo = thingsToDo.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
				self.navigationController?.popViewController(animated: true)
			} else {
				let alert = UIAlertController(title: "Already exists!", message: "The date you are trying to add already has an entry in the agenda.", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
				self.present(alert, animated: true)
				
			}
		} else {
			// maybe remove this?
			let alert = UIAlertController(title: "No title!", message: "You have not given a title yet.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
			self.present(alert, animated: true)
		}
	}
	
	@IBAction func showDatePicker(_ sender: Any) {
		if (datePicker.isHidden) {
			datePicker.isHidden = false
			showDateButton.setTitle(formatter.string(from: datePicker.date), for: .normal)
		} else if (!datePicker.isHidden) {
			datePicker.isHidden = true
			showDateButton.setTitle(formatter.string(from: datePicker.date), for: .normal)
		}
	}
	
	// without this, pressing done will not hide the keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
	}
}
