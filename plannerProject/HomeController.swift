import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		DummyData().addData()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		self.title = "Home" // sets title of tab
    }
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! HomeCollectionViewCell
		
		// this is the only thing i know how to add so far
		// should be able to add things programmatically
		cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
		cell.cardButton.setTitle(thingsToDo[indexPath.row].title, for: .normal)
		
		cell.contentView.layer.cornerRadius = 4.0
		cell.contentView.layer.borderWidth = 1.0
		cell.contentView.layer.borderColor = UIColor.clear.cgColor
		cell.contentView.layer.masksToBounds = false
		cell.layer.shadowColor = UIColor.gray.cgColor
		cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
		cell.layer.shadowRadius = 4.0
		cell.layer.shadowOpacity = 1.0
		cell.layer.masksToBounds = false
		cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return thingsToDo.count
	}
}

class DummyData {
	func addData() {
		let two = Agenda(date: Date(timeInterval: -86400 * 2, since: Date()), title: "Some data for the home page")
		let three = Agenda(date: Date(timeInterval: -86400 * 3, since: Date()), title: "Oh? Another title")
		let four = Agenda(date: Date(timeInterval: -86400 * 4, since: Date()), title: "This is some title for an agenda")
		let five = Agenda(date: Date(timeInterval: -86400 * 5, since: Date()), title: "Travis Scott")
		
		thingsToDo.append(two)
		thingsToDo.append(three)
		thingsToDo.append(four)
		thingsToDo.append(five)
	}
}
