//
//  InfoController.swift
//  plannerProject
//
//  Created by Bradley Kenny on 26/11/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import UIKit

class InfoController: UIViewController {

	@IBOutlet weak var textLabel: UILabel!
	@IBOutlet weak var descriptionBox: UITextView!
	@IBOutlet weak var thoughtBox: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		textLabel.text = thingsToDo[selected].toString()
		if (thingsToDo[selected].title != "") {
			descriptionBox.text = thingsToDo[selected].title
		}
    }
	
	override func viewDidAppear(_ animated: Bool) {
		// this won't work?
		thingsToDo[selected].thoughts = thoughtBox.text
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
