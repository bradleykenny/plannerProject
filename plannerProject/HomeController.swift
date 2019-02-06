//
//  HomeController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 6/2/19.
//  Copyright © 2019 Bradley Kenny. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {

	@IBOutlet weak var cardThing: UIView!
	@IBOutlet weak var cardButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = true
		self.title = "Home" // sets title of tab
		
		print(thingsToDo)
		
    }
}
