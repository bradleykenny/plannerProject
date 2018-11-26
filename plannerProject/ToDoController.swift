//
//  ToDoController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

var thingsToDo = ["22nd Nov, 2018", "23rd Nov, 2018", "24th Nov, 2018", "25th Nov, 2018", "26th Nov, 2018", "1st Dec, 2018"]
var thingsToDo2: Dictionary<Date, String> = [:]
var selected = 0

class ToDoController: UITableViewController {
	
	@IBOutlet var toDoTable: UITableView!
	
	// returns number of items in array
	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (thingsToDo.count)
	}
	
	// fills the cells with content from the array above (thingsToDo)
	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
			cell.textLabel?.text = thingsToDo[indexPath.row]
		
		return(cell)
	}
	
	// everything that will happen once the app has loaded
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Things" // sets title of tab
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
