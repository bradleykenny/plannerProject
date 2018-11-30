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
	
	let formatter = DateFormatter()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "New Plan"

		// do any additional setup after loading the view
		input1.borderStyle = UITextField.BorderStyle.none

		// indents text in textfield
		let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:0))
		input1.leftViewMode = UITextField.ViewMode.always
		input1.leftView = spacerView
		self.input1.delegate = self

		// view.backgroundColor = UIColor.darkGray
		// addButton.tintColor = nil
		// addButton.layer.cornerRadius = 8
		addButton.setTitleColor(UIColor.white, for: .normal)
		
		// datePicker set-up
		datePicker?.datePickerMode = UIDatePicker.Mode.date
		datePicker.isHidden = true
	
		formatter.dateFormat = "E dd MMMM, yyyy"
		
		showDateButton.setTitle(formatter.string(from: datePicker.date), for: .normal)
		showDateButton.layer.cornerRadius = 5.0
		// let color = UIColor(red: 0, green: 122, blue: 255, alpha: 1)
		// showDateButton.layer.backgroundColor = color.cgColor
		// showDateButton.tintColor = UIColor.clear
    }
	
	@IBAction func addToArray(_ sender: Any) {
		if (input1.text != "") {
			let temp = ToDoController()
			if (!temp.compareDatesToArr(arr: thingsToDo, date: datePicker.date)) {
				let newItem = ToDo(date: datePicker.date, title: input1.text!)
				thingsToDo.append(newItem)
				thingsToDo = thingsToDo.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
				self.navigationController?.popViewController(animated: true)
			} else {
				let alert = UIAlertController(title: "Already exists!", message: "The date you are trying to add already has an entry in the agenda.", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
				self.present(alert, animated: true)
				
			}
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
