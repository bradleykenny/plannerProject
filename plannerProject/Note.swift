import Foundation
import UIKit

// 4 types of things to share: agenda, todo, task, note

// a note is a normal post; can contain attachments such as images
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
