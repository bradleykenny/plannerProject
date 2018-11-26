//
//  ToDoController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

var thingsToDo = ["22nd Nov, 2018", "23rd Nov, 2018", "24th Nov, 2018", "25th Nov, 2018", "26th Nov, 2018"]
var selected = 0

class ToDoController: UITableViewController {
	
	@IBOutlet var toDoTable: UITableView!
	
	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (thingsToDo.count)
	}
	
	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
			cell.textLabel?.text = thingsToDo[indexPath.row]
			return(cell)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Things"
		// Do any additional setup after loading the view.
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
