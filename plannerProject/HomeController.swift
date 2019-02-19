import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		self.title = "Home" // sets title of tab
		
		
    }
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! HomeCollectionViewCell
		let text = UIButton(type: .roundedRect)
		cell.addSubview(text)
		cell.cardButton.setTitle("HELLO", for: .normal)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
}

class DummyData {
	func addData() {
		
	}
}
