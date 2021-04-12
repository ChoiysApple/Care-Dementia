import UIKit
import PlaygroundSupport


let viewRect = CGRect(x: 0, y: 0, width: 480, height: 720)

// Main
let firstVC = FirstViewController()
let navVC = UINavigationController(rootViewController: firstVC)

navVC.setNavigationBarHidden(false, animated: false)
navVC
navVC.view.frame = viewRect

PlaygroundPage.current.liveView = navVC.view

// Title Page
class FirstViewController: UIViewController {
    
    override func loadView() {
        let view = UIView(frame: viewRect)
        view.backgroundColor = customColor.main
        
        
        // Title
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "You should Care Dementia!"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // center Emoji
        let centerEmoji = UILabel()
        centerEmoji.translatesAutoresizingMaskIntoConstraints = false
        centerEmoji.text = "🧑‍⚕️"
        centerEmoji.textAlignment = .center
        centerEmoji.font = UIFont.systemFont(ofSize: 150)
    
        view.addSubview(centerEmoji)
        NSLayoutConstraint.activate([
            centerEmoji.heightAnchor.constraint(equalToConstant: 300),
            centerEmoji.widthAnchor.constraint(equalToConstant: 300),
            centerEmoji.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -10),
            centerEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // button
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        nextButton.setTitle("Should I?", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.backgroundColor = customColor.tint
        nextButton.layer.cornerRadius = 10
        
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        self.view = view
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = SecondViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

// Introduction Page
class SecondViewController: UIViewController {
    override func loadView() {
        let view = UIView(frame: viewRect)
        view.backgroundColor = customColor.main
        
        // Title
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "First, What is Dementia?"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        self.view = view
    }
}







struct customColor {
    static let main = #colorLiteral(red: 0.968627451, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
    static let tint = #colorLiteral(red: 0.4470588235, green: 0.4392156863, blue: 0.4235294118, alpha: 1)
}



