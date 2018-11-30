//
//  ToDoController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

var thingsToDo: [ToDo] = []
var selected = 0

struct Task {
	var description: String
	var check: Bool
	
	init(description: String) {
		self.description = description
		self.check = false
	}
}

struct ToDo {
	var date: Date
	var title: String
	var todos: [String]
	var thoughts: String
	var tasks: [Task]
	
	init(date: Date, title: String) {
		self.date = date
		self.title = title
		self.todos = []
		self.thoughts = ""
		self.tasks = [Task(description: "First one!")]
	}
	
	func toString(shortMonth: Bool, includeDay: Bool, includeYear: Bool) -> String {
		// Return the date var in the form of DDth MM, YYYY.
		// For example, 28th March, 1998.
		let date = self.date
		let calendar = Calendar.current
		let formatter = DateFormatter()
		let day = calendar.component(.day, from: date)
		
		var inWords: String = ""
		
		if (includeDay) {
			formatter.dateFormat = "EEEE"
			inWords.append(formatter.string(from: date) + " ")
		}
		
		formatter.dateFormat = "dd"
		inWords.append(formatter.string(from: date))
		
		if (shortMonth) {
			formatter.dateFormat = "MMM"
		} else {
			formatter.dateFormat = "MMMM"
		}
		inWords.append(" " + formatter.string(from: date))
		
		if (includeYear) {
			formatter.dateFormat = "YYYY"
			inWords.append(", " + formatter.string(from: date))
		}
		
		return inWords
	}
}

class ToDoController: UITableViewController {
	
	@IBOutlet var toDoTable: UITableView!
	@IBOutlet weak var editButton: UIBarButtonItem!
	
	// returns number of items in array
	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (thingsToDo.count)
	}
	
	// fills the cells with content from the array above (thingsToDo)
	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
		// cell.accessoryType = UITableViewCell.AccessoryType.checkmark
		cell.textLabel?.text = thingsToDo[indexPath.row].title
		cell.detailTextLabel?.text = thingsToDo[indexPath.row].toString(shortMonth: false, includeDay: true, includeYear: true)
		cell.layer.cornerRadius = 8.0
		// cell.backgroundColor = .red
		
		// toDoTable.separatorColor = .gray // TODO: style this better
		// cell.backgroundColor = UIColor.yellow
		
		return(cell)
	}
	
	// everything that will happen once the app has loaded
	override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		// navigationController?.navigationBar.backgroundColor = UIColor.blue
		// navigationController?.navigationBar.barTintColor = UIColor.green
		self.title = "Agenda" // sets title of tab
		editButton.title = "Edit"
		
		/*** BEGIN TEST DATA ***/
		let one = ToDo(date: Date(timeInterval: -86400 * 1, since: Date()), title: "Day 1")
		let two = ToDo(date: Date(timeInterval: -86400 * 2, since: Date()), title: "Day 2")
		let three = ToDo(date: Date(timeInterval: -86400 * 3, since: Date()), title: "Day 3")
		let four = ToDo(date: Date(timeInterval: -86400 * 4, since: Date()), title: "Day 4")
		let five = ToDo(date: Date(timeInterval: -86400 * 5, since: Date()), title: "Day 5")
		
		thingsToDo.append(one)
		thingsToDo.append(two)
		thingsToDo.append(three)
		thingsToDo.append(four)
		thingsToDo.append(five)
		/*** END TEST DATA ***/
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		// every time the view appears, we reload the table data
		toDoTable.reloadData()
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// gets currently selected item's index in array
		selected = indexPath.row
		self.performSegue(withIdentifier: "toView", sender: self)
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		// this checks the right to left swipe and removes items from the array
		if (editingStyle == UITableViewCell.EditingStyle.delete) {
			let alert = UIAlertController(title: "Delete Day", message: "Are you sure you want to delete the day from your agenda? This cannot be undone.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
				thingsToDo.remove(at: indexPath.row)
				self.toDoTable.reloadData()
			}))
			alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
			self.present(alert, animated: true)
		}
	}
	
	@IBAction func editMode(_ sender: Any) {
		if (toDoTable.isEditing == true) {
			editButton.title = "Edit"
			editButton.style = .plain
		} else {
			editButton.title = "Done"
			editButton.style = .done
		}
		toDoTable.isEditing.toggle()
	}
	
	public func getDay(date: Date) -> Int {
		let calendar = Calendar.current
		return calendar.component(.day, from: date)
	}
	
	public func getMonth(date: Date) -> Int {
		let calendar = Calendar.current
		return calendar.component(.month, from: date)
	}
	
	public func getYear(date: Date) -> Int {
		let calendar = Calendar.current
		return calendar.component(.year, from: date)
	}
	
	public func compareDatesToArr(arr: [ToDo], date: Date) -> Bool {
		for temp in arr {
			if (getYear(date: temp.date) == getYear(date: date)) {
				if (getMonth(date: temp.date) == getMonth(date: date)) {
					if (getDay(date: temp.date) == getDay(date: date)) {
						return true
					}
				}
			}
		}
		return false
	}
}
