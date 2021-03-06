import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		DummyData().addData()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		self.title = "Home" // sets title of tab
    }
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let card = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! HomeCollectionViewCell
		
		card.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
		card.cardUsername.setTitle("@bradleykenny", for: .normal)
		card.cardTime.text = thingsToDo[indexPath.row].toString(shortMonth: false, includeDay: true, includeYear: true)
		card.cardText.text = thingsToDo[indexPath.row].title
		card.cardUserImage.image = UIImage(named: "grayCircle")
		
		return card
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return thingsToDo.count
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		selected = indexPath.row
		let card = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! HomeCollectionViewCell
		card.backgroundColor = .gray
		self.performSegue(withIdentifier: "cardToView", sender: self)
	}
}

class DummyData {
	func addData() {
		let two = Agenda(date: Date(timeInterval: -86400 * 2, since: Date()), title: "Some data for the home page")
		let three = Agenda(date: Date(timeInterval: -86400 * 3, since: Date()), title: "Oh? Another title")
		let four = Agenda(date: Date(timeInterval: -86400 * 4, since: Date()), title: "This is some title for an agenda")
		let five = Agenda(date: Date(timeInterval: -86400 * 5, since: Date()), title: "Travis Scott")
		let six = Agenda(date: Date(timeInterval: -86400 * 6, since: Date()), title: "Sixth bit of text")
		let seven = Agenda(date: Date(timeInterval: -86400 * 7, since: Date()), title: "Some more text that is number seven.")
		let eight = Agenda(date: Date(timeInterval: -86400 * 8, since: Date()), title: "Eight eggs on the wall.")
		let nine = Agenda(date: Date(timeInterval: -86400 * 10, since: Date()), title: "Nine times nine is eighty-one.")
		let ten = Agenda(date: Date(timeInterval: -86400 * 23, since: Date()), title: "Ten tens are a hundred.")
		let eleven = Agenda(date: Date(timeInterval: -86400 * 32, since: Date()), title: "Not sure what to post here.")
		let twelve = Agenda(date: Date(timeInterval: -86400 * 100, since: Date()), title: "The last one... for now!!!")
		
		thingsToDo.append(two)
		thingsToDo.append(three)
		thingsToDo.append(four)
		thingsToDo.append(five)
		thingsToDo.append(six)
		thingsToDo.append(seven)
		thingsToDo.append(eight)
		thingsToDo.append(nine)
		thingsToDo.append(ten)
		thingsToDo.append(eleven)
		thingsToDo.append(twelve)
	}
}
