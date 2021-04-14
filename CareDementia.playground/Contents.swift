import UIKit
import PlaygroundSupport

let viewRect = CGRect(x: 0, y: 0, width: 480, height: 720)

// Main
let firstVC = ViewController()



PlaygroundPage.current.liveView = firstVC.view

// Title Page
class ViewController: UIViewController {
    
    override func loadView() {
        let view = UIView(frame: viewRect)
        view.backgroundColor = UIColor.white

        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "title"
        titleLabel.backgroundColor = .gray
        
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = "title"
        subLabel.backgroundColor = .red
        
        
        view.addSubview(subLabel)
        NSLayoutConstraint.activate([
            subLabel.widthAnchor.constraint(equalToConstant: 100),
            subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        self.view = view
    }

}


