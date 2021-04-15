//  CareDementia.playground
//  Care Dementia
//
//  Created by Daegun Choi

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
    }   // [END] of loadView
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = SecondViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}   // [END] of ThirdViewController

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
    }   // [END] of loadView
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = ThirdViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
        
}   // [END] of SecondViewController



// Statistics Page
class ThirdViewController: UIViewController {
    
    var sliderValue = 64
    var currentAgeCode = 0

    var interactionInfo = addDescription("info")
    var collectionView: UICollectionView?
    var alertLabel = addDescription(descriptions.statistics_alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = addView()
        
        // title
        let titleLabel = addHeading(descriptions.statistics_title)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 400),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
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
        
        // Description
        let descriptionLabel = addDescription(descriptions.statistics_description)
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.widthAnchor.constraint(equalToConstant: 400),
            descriptionLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true

        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 400),
            contentView.heightAnchor.constraint(equalToConstant: 150),
            contentView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        // Statistics visual view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 9, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 49, height: 49)

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.backgroundColor = UIColor.white
        collectionView?.layer.cornerRadius = 10
        collectionView?.dataSource = self

        contentView.addSubview(collectionView ?? UICollectionView())
        

        // slider
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 64
        slider.maximumValue = 85
        slider.minimumTrackTintColor = customColor.tint
        slider.addTarget(self, action: #selector(sliderUpdate), for: .valueChanged)
        view.addSubview(slider)
        NSLayoutConstraint.activate([
            slider.widthAnchor.constraint(equalToConstant: 400),
            slider.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        let minLabel = addDescription("64")
        view.addSubview(minLabel)
        NSLayoutConstraint.activate([
            minLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 5),
            minLabel.leftAnchor.constraint(equalTo: slider.leftAnchor, constant: 5)
        ])
        
        let ageLabel = addDescription("Age")
        view.addSubview(ageLabel)
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 5),
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let maxLabel = addDescription("85")
        view.addSubview(maxLabel)
        NSLayoutConstraint.activate([
            maxLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 5),
            maxLabel.rightAnchor.constraint(equalTo: slider.rightAnchor)
        ])
        
        // Description
        interactionInfo.text = data.prevelence_range[0]
        interactionInfo.textAlignment = .center
        interactionInfo.textColor = customColor.tint
        interactionInfo.font = UIFont(name: "AvenirNext-SemiBold", size: 50)
        view.addSubview(interactionInfo)
        NSLayoutConstraint.activate([
            interactionInfo.widthAnchor.constraint(equalToConstant: 400),
            interactionInfo.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 50),
            interactionInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        alertLabel.isHidden = true
        alertLabel.textAlignment = .center
        alertLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        alertLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
        view.addSubview(alertLabel)
        NSLayoutConstraint.activate([
            alertLabel.widthAnchor.constraint(equalToConstant: 450),
            alertLabel.topAnchor.constraint(equalTo: interactionInfo.bottomAnchor, constant: 40),
            alertLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Button
        let nextButton = addButton(descriptions.statistics_button)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 400),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        self.view = view
    }   // [END] of loadView
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = FourthViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func sliderUpdate(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        
        let newAgeCode = getAgeCode(age: sliderValue)
        if currentAgeCode != newAgeCode {
            collectionView?.reloadData()
            interactionInfo.text = getAgeDescription(age: sliderValue)
            currentAgeCode = newAgeCode
            
            if newAgeCode == 4{
                alertLabel.isHidden = false
                
            }
        }
        
    }
    
    

    
}   // [END] of ThirdViewController

// Collection View Data Source
extension ThirdViewController: UICollectionViewDataSource {
   // CollectionView DataSource Protocol stubs
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 14
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
    
        title.text = cellContent(age: sliderValue, cellIndex: indexPath.row)
        title.font = UIFont(name: "AvenirNext-Bold", size: 35)
        title.textAlignment = .center
        cell.contentView.addSubview(title)

       return cell
   }
    

}

extension ThirdViewController {
    
    func getAgeCode(age: Int) -> Int {
        if age > 64 && age < 75 {return 1 }
        else if age >= 75 && age < 80 {return 2}
        else if age >= 80 && age < 85 {return 3}
        else if age == 85 {return 4}
        else { return 0 }
    }
    
    func cellContent(age: Int, cellIndex: Int) -> String {
        
        let ageCode = getAgeCode(age: age)
        
        if !data.prevelence[ageCode][cellIndex]{
            return "👴🏻"
        } else {
            return "🤕"
        }
    }
    
    func getAgeDescription(age: Int) -> String {
        let ageCode = getAgeCode(age: age)
        
        return data.prevelence_range[ageCode]
    }
}

class FourthViewController: UIViewController {
    
    override func loadView() {
        let view = addView()

        self.view = view
    }   // [END] of loadView
}   // [END] of ThirdViewController


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
    
    static let statistics_title = "You might think Dementia is not common thing"
    static let statistics_description = "How many people get Dementia by getting old?"
    static let statistics_alert = "You can see, lots of Old people get Dementia"
    static let statistics_button = "Old people get Dementia, But I'm not old"
    
}

struct data {
    static let prevelence = [
        [false, false, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, false, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, true, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, true, true, false, false, false, false, false, false, false, false, false, false]
    ]
    static let prevelence_range = [
        "Under 65 |  2% of prevelence",
        "65 ~ 74  |  4% of prevelence",
        "75 ~ 79  |  12% of prevelence",
        "80 ~ 84  |  20% of prevelence",
        "Over 85  |  40% of prevelence"
    ]

}

//Custom functions for UI
func addView() -> UIView {
    let view = UIView(frame: viewRect)
    view.backgroundColor = customColor.main
    
    return view
}

func addHeading(_ title: String) -> UILabel{
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = title
    titleLabel.numberOfLines = 0
    titleLabel.textColor = UIColor.black
    titleLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
    
    return titleLabel
}

func addEmoji(_ emoji: String, _ size: Float) -> UILabel {
    let centerEmoji = UILabel()
    centerEmoji.translatesAutoresizingMaskIntoConstraints = false
    centerEmoji.text = emoji
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
