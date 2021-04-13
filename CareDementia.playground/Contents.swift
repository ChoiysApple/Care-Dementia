//
//  CareDementia.playground
//  Care Dementia
//
//  Created by Daegeon Choi

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
        let view = addView()

        // title
        let titleLabel = addHeading(descriptions.title_heading)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Divider
        let divider = addDivider()
        view.addSubview(divider)
        NSLayoutConstraint.activate([
            divider.widthAnchor.constraint(equalToConstant: 400),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        
        // center Emoji
        let centerEmoji = addEmoji(descriptions.title_emoji, 150)
        view.addSubview(centerEmoji)
        NSLayoutConstraint.activate([
            centerEmoji.heightAnchor.constraint(equalToConstant: 300),
            centerEmoji.widthAnchor.constraint(equalToConstant: 300),
            centerEmoji.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -10),
            centerEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // button

        let nextButton = addButton(descriptions.title_button)
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
        let view = addView()
        
        // Title
        let titleLabel = addHeading(descriptions.introduction_title)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Divider
        let divider = addDivider()
        view.addSubview(divider)
        NSLayoutConstraint.activate([
            divider.widthAnchor.constraint(equalToConstant: 400),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let centerEmoji = addEmoji(descriptions.introduciton_emoji, 100)
        view.addSubview(centerEmoji)
        NSLayoutConstraint.activate([
            centerEmoji.heightAnchor.constraint(equalToConstant: 300),
            centerEmoji.widthAnchor.constraint(equalToConstant: 300),
            centerEmoji.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -10),
            centerEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Description
        let descriptionLabel1 = addDescription(descriptions.introduction_description1)
        view.addSubview(descriptionLabel1)
        NSLayoutConstraint.activate([
            descriptionLabel1.widthAnchor.constraint(equalToConstant: 400),
            descriptionLabel1.topAnchor.constraint(equalTo: centerEmoji.bottomAnchor, constant: -40),
            descriptionLabel1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Description
        let descriptionLabel2 = addDescription(descriptions.introduction_description2)
        view.addSubview(descriptionLabel2)
        NSLayoutConstraint.activate([
            descriptionLabel2.widthAnchor.constraint(equalToConstant: 400),
            descriptionLabel2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 50),
            descriptionLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Button
        let nextButton = addButton(descriptions.introduction_button)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        self.view = view
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = ThirdViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
        
}

// Statistics Page
class ThirdViewController: UIViewController {
    
    override func loadView() {
        let view = addView()
        
        self.view = view
    }
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
    static let introduciton_emoji = "🧠"
    // Dememtia description from: https://www.alzint.org/about/
    static let introduction_description1 = "Dementia is collection of symptoms that are caused by disorders affecting the brain and impact on memory, thinking, behaviour and emotion."
    static let introduction_description2 = "The most common is Alzheimer’s disease, which affects 50-60% of people with dementia."
    static let introduction_button = "Okay, I see"
    
    
}

//Custom Module for UI
func addView() -> UIView {
    let view = UIView(frame: viewRect)
    view.backgroundColor = customColor.main
    
    return view
}

func addHeading(_ title: String) -> UILabel{
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = title
    titleLabel.textColor = UIColor.black
    titleLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
    
    return titleLabel
}

func addEmoji(_ emoji: String, _ size: Float) -> UILabel {
    let centerEmoji = UILabel()
    centerEmoji.translatesAutoresizingMaskIntoConstraints = false
    centerEmoji.text = descriptions.title_emoji
    centerEmoji.textAlignment = .center
    centerEmoji.font = UIFont.systemFont(ofSize: 150)
    
    return centerEmoji
}

func addDivider() -> UIView{
    let divider = UIView()
    divider.backgroundColor = UIColor.lightGray
    divider.translatesAutoresizingMaskIntoConstraints = false

    return divider
}

func addButton(_ button: String) -> UIButton {
    let nextButton = UIButton()
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.setTitle(button, for: .normal)
    nextButton.setTitleColor(UIColor.white, for: .normal)
    nextButton.backgroundColor = customColor.tint
    nextButton.layer.cornerRadius = 10
    
    return nextButton
}

func addDescription(_ description: String) -> UILabel {
    let descriptionLabel = UILabel()
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.text = description
    descriptionLabel.textColor = UIColor.black
    descriptionLabel.numberOfLines = 0
    
    return descriptionLabel
}







