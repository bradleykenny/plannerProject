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

struct ToDo {
	var date: Date
	var title: String
	var todos: [String]
	
	init(date: Date) {
		self.date = date
		self.title = ""
		self.todos = []
	}
	
	func toString() -> String {
		// TODO: return the date var in the form of DDth MM, YYYY.
		//       For example, 28th March, 1998.
		let date = self.date
		let calendar = Calendar.current
		let formatter = DateFormatter()
		let day = calendar.component(.day, from: date)
		
		var inWords: String = ""
		
		var mod: Int = 0
		if (day < 20 && day >= 10) {
			mod = 10
		} else if (day >= 20 && day < 30) {
			mod = 20
		} else if (day >= 30) {
			mod = 30
		}
		
		if (day % mod == 1) {
			inWords.append(String(day) + "st")
		} else if (day % mod == 2) {
			inWords.append(String(day) + "nd")
		} else if (day % mod == 3) {
			inWords.append(String(day) + "rd")
		} else {
			inWords.append(String(day) + "th")
		}
		
		formatter.dateFormat = "MMMM"
		inWords.append(" " + formatter.string(from: date))
		
		formatter.dateFormat = "YYYY"
		inWords.append(", " + formatter.string(from: date))
		
		return ""
	}
}

class ToDoController: UITableViewController {
	
	@IBOutlet var toDoTable: UITableView!
	
	// returns number of items in array
	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (thingsToDo.count)
	}
	
	// fills the cells with content from the array above (thingsToDo)
	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
			cell.textLabel?.text = thingsToDo[indexPath.row].toString()
		print(thingsToDo[indexPath.row].toString())
		
		return(cell)
	}
	
	// everything that will happen once the app has loaded
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Things" // sets title of tab
		let one = ToDo(date: Date(timeInterval: 86400 * 1, since: Date()))
		let two = ToDo(date: Date(timeInterval: 86400 * 2, since: Date()))
		let three = ToDo(date: Date(timeInterval: 86400 * 3, since: Date()))
		thingsToDo.append(one)
		thingsToDo.append(two)
		thingsToDo.append(three)
		
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		toDoTable.reloadData()
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selected = indexPath.row
		self.performSegue(withIdentifier: "toView", sender: self)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
