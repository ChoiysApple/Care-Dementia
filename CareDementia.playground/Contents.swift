import UIKit

let viewRect = CGRect(x: 0, y: 0, width: 500, height: 700)
class FirstViewController: UIViewController {
    
    override func loadView() {
        let view = UIView(frame: viewRect)
        view.backgroundColor = UIColor.red
        
        self.view = view
    }
}




