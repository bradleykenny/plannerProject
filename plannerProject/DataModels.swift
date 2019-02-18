// Data Models for the application.

import Foundation
import UIKit

class DataModels {
	
}

// 4 types of things to share: agenda, todo, task, note

class Note {
	var description: String
	var image: UIImage!
	var date: Date
	
	init(description: String) {
		self.description = description
		self.date = Date()
	}
	
	init(description: String, image: UIImage) {
		self.description = description
		self.image = image
		self.date = Date()
	}
}

class Task {
	var description: String
	var check: Bool
	var date: Date
	
	init(description: String) {
		self.description = description
		self.check = false
		self.date = Date()
	}
}

class Agenda {
	var date: Date
	var title: String
	var todos: [String]
	var thoughts: String
	var tasks: [Task]
	
	init(date: Date, title: String) {
		self.date = date
		self.title = title
		self.todos = []
		self.thoughts = "Just some thought text. This could go on and on and on and on and on and on and on and on and on and on and on and on and on."
		self.tasks = [Task(description: "My first ever task."), Task(description: "A second task for testing.")]
		self.tasks[1].check = true
	}
	
	func toString(shortMonth: Bool, includeDay: Bool, includeYear: Bool) -> String {
		// Return the date var in the form of DDth MM, YYYY.
		// For example, 28th March, 1998.
		let date = self.date
		let formatter = DateFormatter()
		
		var inWords: String = ""
		
		if (includeDay) {
			formatter.dateFormat = "EEEE"
			inWords.append(formatter.string(from: date) + " ")
		}
		
		formatter.dateFormat = "d"
		let day = formatter.string(from: date)
		inWords.append(day)
		
		
		//		if (Int(day) == 1 || Int(day) % 10 == 1 || Int(day) % 20 == 1 || Int(day) % 30 == 1) {
		//			inWords.append("st")
		//		} else if (Int(day) == 2 || Int(day) % 10 == 2 || Int(day) % 20 == 2) {
		//			inWords.append("nd")
		//		} else if (Int(day) == 3 || Int(day) % 10 == 3 || Int(day) % 20 == 3) {
		//			inWords.append("rd")
		//		} else {
		//			inWords.append("th")
		//		}
		
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
