import UIKit
import PlaygroundSupport


let viewRect = CGRect(x: 0, y: 0, width: 480, height: 720)

// Main
let firstVC = FirstViewController()
let navVC = UINavigationController(rootViewController: firstVC)

navVC.setNavigationBarHidden(true, animated: false)
navVC.view.frame = viewRect

PlaygroundPage.current.liveView = navVC.view

// Title Page
class FirstViewController: UIViewController {
    
    override func loadView() {
        let view = UIView(frame: viewRect)
        view.backgroundColor = customColor.main

        // title
        let titleLabel = addHeading()
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // center Emoji
        let centerEmoji = UILabel()
        centerEmoji.translatesAutoresizingMaskIntoConstraints = false
        centerEmoji.text = descriptions.title_emoji
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

        let nextButton = addButton()
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
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
        let titleLabel = addHeading()
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Description
        let descriptionLabel = addDescription()
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.widthAnchor.constraint(equalToConstant: 400),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        self.view = view
    }
}

func addHeading() -> UILabel{
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = descriptions.title_heading
    titleLabel.textColor = UIColor.black
    titleLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
    
    return titleLabel
}

func addButton() -> UIButton {
    let nextButton = UIButton()
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.setTitle(descriptions.title_button, for: .normal)
    nextButton.setTitleColor(UIColor.white, for: .normal)
    nextButton.backgroundColor = customColor.tint
    nextButton.layer.cornerRadius = 10
    return nextButton
}

func addDescription() -> UILabel {
    let descriptionLabel = UILabel()
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.text = descriptions.introduction_description
    descriptionLabel.textColor = UIColor.black
    descriptionLabel.numberOfLines = 0
    
    return descriptionLabel
}



// Constants
struct customColor {
    static let main = #colorLiteral(red: 0.968627451, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
    static let tint = #colorLiteral(red: 0.4470588235, green: 0.4392156863, blue: 0.4235294118, alpha: 1)
}

struct descriptions {
    static let title_heading = "You should Care Dementia!"
    static let title_emoji = "🧑‍⚕️"
    static let title_button = "Should I?"
    
    static let introduction_title = "First, What is Dementia?"
    static let introduction_description = "Dementia is collection of symptoms that are caused by disorders affecting the brain and impact on memory, thinking, behaviour and emotion."
    static let introduction_button = ""
}



