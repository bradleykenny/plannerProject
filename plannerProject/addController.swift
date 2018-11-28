//
//  addController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

class addController: UIViewController {

	@IBOutlet weak var input1: UITextField!
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var datePicker: UIDatePicker!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// do any additional setup after loading the view
		input1.borderStyle = UITextField.BorderStyle.none

		// indents text in textfield
		let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:0))
		input1.leftViewMode = UITextField.ViewMode.always
		input1.leftView = spacerView

		// view.backgroundColor = UIColor.darkGray
		addButton.tintColor = nil
		addButton.layer.cornerRadius = 8
		addButton.setTitleColor(UIColor.white, for: .normal)
    }
    
	@IBAction func addToArray(_ sender: Any) {
		if (input1.text != "") {
			var newItem = ToDo(date: Date())
			newItem.title = input1.text!
			newItem.date = datePicker.date
			thingsToDo.append(newItem)
			thingsToDo = thingsToDo.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
			self.navigationController?.popViewController(animated: true)
		}
	}
}
