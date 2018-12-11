//
//  Calendar.swift
//  plannerProject
//
//  Created by Bradley Kenny on 11/12/18.
//  Copyright © 2018 Bradley Kenny. All rights reserved.
//

import Foundation
import UIKit

class CalendarCell: UICollectionViewCell {
	
	var weekday: String
	var day: Int
	
	init(weekday: String, day: Int) {
		self.weekday = weekday
		self.day = day
		
		super.init(frame: .zero)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
