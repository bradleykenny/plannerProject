import Foundation
import UIKit

// something that should be done, can contain subtasks
class Task {
	var description: String
	var check: Bool
	var date: Date
	var subtasks: [Task]
	
	init(description: String) {
		self.description = description
		self.check = false
		self.date = Date()
		self.subtasks = []
	}
}
