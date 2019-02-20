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
		cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
		cell.cardButton.setTitle(thingsToDo[indexPath.row].title, for: .normal)
		
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
