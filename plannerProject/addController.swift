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
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		input1.borderStyle = UITextField.BorderStyle.none
		
		// indents text in textfield
		let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:0))
		input1.leftViewMode = UITextField.ViewMode.always
		input1.leftView = spacerView
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
