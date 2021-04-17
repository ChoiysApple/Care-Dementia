//  CareDementia.playground
//  Care Dementia
//
//  Created by Daegun Choi

import UIKit
import PlaygroundSupport


// Main
let firstVC = TitleViewController()
let navVC = UINavigationController(rootViewController: firstVC)

navVC.setNavigationBarHidden(true, animated: false)
navVC.view.frame = CGRect(x: 0, y: 0, width: 480, height: 720)


PlaygroundPage.current.liveView = navVC.view

// Title Page
class TitleViewController: UIViewController {
    
    override func loadView() {
        let view = addView()
        
        
        // center Emoji
        let centerEmoji = addEmoji(descriptions.title_emoji, 80)
        view.addSubview(centerEmoji)
        NSLayoutConstraint.activate([
            centerEmoji.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            centerEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // title
        let titleLabel = addHeading(descriptions.title_heading)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: centerEmoji.bottomAnchor, constant: 20)
        ])
        
        // Divider
        let divider = addDivider()
        view.addSubview(divider)
        NSLayoutConstraint.activate([
            divider.widthAnchor.constraint(equalToConstant: 400),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // button
        let nextButton = addButton(descriptions.title_button)
        nextButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 25)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 300),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 80),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let skipButton = addSkipButton(descriptions.title_skipButton)
        skipButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(skipButton)
        NSLayoutConstraint.activate([
            skipButton.heightAnchor.constraint(equalToConstant: 50),
            skipButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        self.view = view
    }   // [END] of loadView
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == descriptions.title_button {
            self.navigationController?.pushViewController(IntroductionViewController(), animated: true)

        } else {
            self.navigationController?.pushViewController(TestinfoViewController(), animated: true)
        }
        
    }
    
}   // [END] of StastisticsViewController

// Introduction Page
class IntroductionViewController: UIViewController {
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
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        self.view = view
    }   // [END] of loadView
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = StastisticsViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
        
}   // [END] of IntroductionViewController



// Show how much old people commomly get Dementia by
class StastisticsViewController: UIViewController {
    
    var sliderValue = 64
    var currentAgeCode = 0

    var interactionInfo = addDescription("")
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
        
        let collectionLabel = addDescription(descriptions.statistics_collectionDescription)
        collectionLabel.font = UIFont(name: "AvenirNext-medium", size: 12)
        view.addSubview(collectionLabel)
        NSLayoutConstraint.activate([
            collectionLabel.widthAnchor.constraint(equalToConstant: 400),
            collectionLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            collectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
            contentView.topAnchor.constraint(equalTo: collectionLabel.bottomAnchor, constant: 20),
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
        interactionInfo.font = UIFont(name: "AvenirNext-Regular", size: 20)
        view.addSubview(interactionInfo)
        NSLayoutConstraint.activate([
            interactionInfo.widthAnchor.constraint(equalToConstant: 400),
            interactionInfo.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 50),
            interactionInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // alertLabel: Appears when slider reached max
        alertLabel.isHidden = true
        alertLabel.textAlignment = .center
        alertLabel.textColor = customColor.alertColor
        alertLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
        view.addSubview(alertLabel)
        NSLayoutConstraint.activate([
            alertLabel.widthAnchor.constraint(equalToConstant: 450),
            alertLabel.topAnchor.constraint(equalTo: interactionInfo.bottomAnchor, constant: 30),
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
        let nextVC = AwarenessViewController()
        
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
    
    

    
}   // [END] of StastisticsViewController

// Collection View Data Source
extension StastisticsViewController: UICollectionViewDataSource {
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

// custom methods
extension StastisticsViewController {
    
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
            return "😄"
        } else {
            return "🥵"
        }
    }
    
    func getAgeDescription(age: Int) -> String {
        let ageCode = getAgeCode(age: age)
        
        return data.prevelence_range[ageCode]
    }
}

// Why Dementia is even related to young people
class AwarenessViewController: UIViewController {
    
    var isAllTapped = [false, false, false]
    
    let descriptionLabel1 = addDescription(descriptions.awareness_description1)
    let descriptionLabel2 = addDescription(descriptions.awareness_description2)
    let descriptionLabel3 = addDescription(descriptions.awareness_description3)
    let conclusionEmoji = addEmojiButton(descriptions.awareness_conclusionEmoji, 50)
    let nextButton = addButton(descriptions.awareness_button)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let view = addView()
        
        // title
        let titleLabel = addHeading(descriptions.awareness_title)
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
        let introductionLabel = addDescription(descriptions.awareness_introduction)
        view.addSubview(introductionLabel)
        NSLayoutConstraint.activate([
            introductionLabel.widthAnchor.constraint(equalToConstant: 400),
            introductionLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            introductionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let guideLabel = addDescription(descriptions.awareness_guide)
        guideLabel.font = UIFont(name: "AvenirNext-medium", size: 12)
        view.addSubview(guideLabel)
        NSLayoutConstraint.activate([
            guideLabel.widthAnchor.constraint(equalToConstant: 400),
            guideLabel.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 10),
            guideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Emoji + Description1
        let emoji1 = addEmojiButton(descriptions.awareness_emoji1, 50)
        emoji1.addTarget(self, action: #selector(emojiButton1Tapped(_:)), for: .touchUpInside)
        view.addSubview(emoji1)
        NSLayoutConstraint.activate([
            emoji1.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 30),
            emoji1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        descriptionLabel1.isHidden = true
        view.addSubview(descriptionLabel1)
        NSLayoutConstraint.activate([
            descriptionLabel1.widthAnchor.constraint(equalToConstant: 300),
            descriptionLabel1.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 40),
            descriptionLabel1.leftAnchor.constraint(equalTo: emoji1.rightAnchor, constant: 10)
        ])
        
        // Emoji + Description2
        let emoji2 = addEmojiButton(descriptions.awareness_emoji2, 50)
        emoji2.addTarget(self, action: #selector(emojiButton2Tapped(_:)), for: .touchUpInside)
        view.addSubview(emoji2)
        NSLayoutConstraint.activate([
            emoji2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 25),
            emoji2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        descriptionLabel2.isHidden = true
        view.addSubview(descriptionLabel2)
        NSLayoutConstraint.activate([
            descriptionLabel2.widthAnchor.constraint(equalToConstant: 300),
            descriptionLabel2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 35),
            descriptionLabel2.leftAnchor.constraint(equalTo: emoji2.rightAnchor, constant: 10)
        ])
        
        // Emoji + Description3
        let emoji3 = addEmojiButton(descriptions.awareness_emoji3, 50)
        emoji3.addTarget(self, action: #selector(emojiButton3Tapped(_:)), for: .touchUpInside)
        view.addSubview(emoji3)
        NSLayoutConstraint.activate([
            emoji3.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 30),
            emoji3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        descriptionLabel3.isHidden = true
        view.addSubview(descriptionLabel3)
        NSLayoutConstraint.activate([
            descriptionLabel3.widthAnchor.constraint(equalToConstant: 300),
            descriptionLabel3.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 30),
            descriptionLabel3.leftAnchor.constraint(equalTo: emoji1.rightAnchor, constant: 10)
        ])
        
        conclusionEmoji.isHidden = true
        conclusionEmoji.addTarget(self, action: #selector(emojiButtonCTapped(_:)), for: .touchUpInside)
        view.addSubview(conclusionEmoji)
        NSLayoutConstraint.activate([
            conclusionEmoji.widthAnchor.constraint(equalToConstant: 400),
            conclusionEmoji.topAnchor.constraint(equalTo: descriptionLabel3.bottomAnchor, constant: 55),
            conclusionEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        
        // Button
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        nextButton.isHidden = true
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 400),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        self.view = view
    }   // [END] of loadView
    
    @objc func emojiButton1Tapped(_ sender: UIButton) {
        isAllTapped[0] = true
        descriptionLabel1.isHidden = false
        checkAllTapped()
    }
    
    @objc func emojiButton2Tapped(_ sender: UIButton) {
        isAllTapped[1] = true
        descriptionLabel2.isHidden = false
        checkAllTapped()
    }
    
    @objc func emojiButton3Tapped(_ sender: UIButton) {
        isAllTapped[2] = true
        descriptionLabel3.isHidden = false
        checkAllTapped()
    }
    
    @objc func emojiButtonCTapped(_ sender: UIButton) {
        sender.titleLabel?.textAlignment = .center
        sender.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 20)
        sender.setTitleColor(customColor.alertColor, for: .normal)
        sender.setTitle(descriptions.awareness_conclusionDescription, for: .normal)
        sender.titleLabel?.numberOfLines = 0
        nextButton.isHidden = false
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = BenefitViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func checkAllTapped() {
        
        for i in isAllTapped {
            if i == false {
                return
            }
        }
        
        conclusionEmoji.isHidden = false
    }
    
}   // [END] of StastisticsViewController

// Benefits of diagnosing Dementia in advance
class BenefitViewController: UIViewController {
    
    var isAllTapped = [false, false, false, false]
    
    let descriptionLabel1 = addDescription(descriptions.benefits_description1)
    let descriptionLabel2 = addDescription(descriptions.benefits_description2)
    let descriptionLabel3 = addDescription(descriptions.benefits_description3)
    let descriptionLabel4 = addDescription(descriptions.benefits_description4)
    let nextButton = addButton(descriptions.benefits_button)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let view = addView()
        
        // title
        let titleLabel = addHeading(descriptions.benefits_title)
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
        let introductionLabel = addDescription(descriptions.benefits_introduction)
        view.addSubview(introductionLabel)
        NSLayoutConstraint.activate([
            introductionLabel.widthAnchor.constraint(equalToConstant: 400),
            introductionLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            introductionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let guideLabel = addDescription(descriptions.awareness_guide)
        guideLabel.font = UIFont(name: "AvenirNext-medium", size: 12)
        view.addSubview(guideLabel)
        NSLayoutConstraint.activate([
            guideLabel.widthAnchor.constraint(equalToConstant: 400),
            guideLabel.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 10),
            guideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Emoji + Description1
        let emoji1 = addEmojiButton(descriptions.benefits_emoji1, 50)
        emoji1.addTarget(self, action: #selector(emojiButton1Tapped(_:)), for: .touchUpInside)
        view.addSubview(emoji1)
        NSLayoutConstraint.activate([
            emoji1.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 30),
            emoji1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        descriptionLabel1.isHidden = true
        view.addSubview(descriptionLabel1)
        NSLayoutConstraint.activate([
            descriptionLabel1.widthAnchor.constraint(equalToConstant: 350),
            descriptionLabel1.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 40),
            descriptionLabel1.leftAnchor.constraint(equalTo: emoji1.rightAnchor, constant: 10)
        ])

        // Emoji + Description2
        let emoji2 = addEmojiButton(descriptions.benefits_emoji2, 50)
        emoji2.addTarget(self, action: #selector(emojiButton2Tapped(_:)), for: .touchUpInside)
        view.addSubview(emoji2)
        NSLayoutConstraint.activate([
            emoji2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 25),
            emoji2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        descriptionLabel2.isHidden = true
        view.addSubview(descriptionLabel2)
        NSLayoutConstraint.activate([
            descriptionLabel2.widthAnchor.constraint(equalToConstant: 350),
            descriptionLabel2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 35),
            descriptionLabel2.leftAnchor.constraint(equalTo: emoji2.rightAnchor, constant: 10)
        ])

        // Emoji + Description3
        let emoji3 = addEmojiButton(descriptions.benefits_emoji3, 50)
        emoji3.addTarget(self, action: #selector(emojiButton3Tapped(_:)), for: .touchUpInside)
        view.addSubview(emoji3)
        NSLayoutConstraint.activate([
            emoji3.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 30),
            emoji3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        descriptionLabel3.isHidden = true
        view.addSubview(descriptionLabel3)
        NSLayoutConstraint.activate([
            descriptionLabel3.widthAnchor.constraint(equalToConstant: 350),
            descriptionLabel3.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 45),
            descriptionLabel3.leftAnchor.constraint(equalTo: emoji3.rightAnchor, constant: 10)
        ])

        // Emoji + Description4
        let emoji4 = addEmojiButton(descriptions.benefits_emoji4, 50)
        emoji4.addTarget(self, action: #selector(emojiButton4Tapped(_:)), for: .touchUpInside)
        view.addSubview(emoji4)
        NSLayoutConstraint.activate([
            emoji4.topAnchor.constraint(equalTo: descriptionLabel3.bottomAnchor, constant: 30),
            emoji4.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        descriptionLabel4.isHidden = true
        view.addSubview(descriptionLabel4)
        NSLayoutConstraint.activate([
            descriptionLabel4.widthAnchor.constraint(equalToConstant: 350),
            descriptionLabel4.topAnchor.constraint(equalTo: descriptionLabel3.bottomAnchor, constant: 45),
            descriptionLabel4.leftAnchor.constraint(equalTo: emoji4.rightAnchor, constant: 10)
        ])
        
        // Button
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        nextButton.isHidden = true
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 400),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        self.view = view
    }   // [END] of loadView
    
    @objc func emojiButton1Tapped(_ sender: UIButton) {
        isAllTapped[0] = true
        descriptionLabel1.isHidden = false
        checkAllTapped()
    }
    
    @objc func emojiButton2Tapped(_ sender: UIButton) {
        isAllTapped[1] = true
        descriptionLabel2.isHidden = false
        checkAllTapped()
    }
    
    @objc func emojiButton3Tapped(_ sender: UIButton) {
        isAllTapped[2] = true
        descriptionLabel3.isHidden = false
        checkAllTapped()
    }
    
    @objc func emojiButton4Tapped(_ sender: UIButton) {
        isAllTapped[3] = true
        descriptionLabel4.isHidden = false
        checkAllTapped()
    }
    
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        let nextVC = TestinfoViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func checkAllTapped() {
        
        for i in isAllTapped {
            if i == false {
                return
            }
        }
        
        nextButton.isHidden = false
    }
    
}

// Test introduciton for dementia
class TestinfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        let titleLabel = addHeading(descriptions.testinfo_title)
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
        let introductionLabel = addDescription(descriptions.testinfo_introduction)
        introductionLabel.font = UIFont(name: "AvenirNext-regular", size: 15)
        view.addSubview(introductionLabel)
        NSLayoutConstraint.activate([
            introductionLabel.widthAnchor.constraint(equalToConstant: 400),
            introductionLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            introductionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    
        let guideLabel = addDescription(descriptions.testinfo_guide)
        guideLabel.font = UIFont(name: "AvenirNext-medium", size: UIFont.labelFontSize)
        view.addSubview(guideLabel)
        NSLayoutConstraint.activate([
            guideLabel.widthAnchor.constraint(equalToConstant: 400),
            guideLabel.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 20),
            guideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Emoji + Description1
        let emoji1 = addEmojiButton(descriptions.testinfo_emoji1, 50)
        view.addSubview(emoji1)
        NSLayoutConstraint.activate([
            emoji1.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 35),
            emoji1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        let nameLabel1 = addDescription(descriptions.testinfo_test1)
        let descriptionLabel1 = addDescription(descriptions.testinfo_description1)
        nameLabel1.font = UIFont(name: "AvenirNext-bold", size: UIFont.labelFontSize)
        descriptionLabel1.font = UIFont(name: "AvenirNext-regular", size: 15)
        view.addSubview(nameLabel1)
        view.addSubview(descriptionLabel1)
        NSLayoutConstraint.activate([
            nameLabel1.widthAnchor.constraint(equalToConstant: 350),
            nameLabel1.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 40),
            nameLabel1.leftAnchor.constraint(equalTo: emoji1.rightAnchor, constant: 10),
            
            descriptionLabel1.widthAnchor.constraint(equalToConstant: 350),
            descriptionLabel1.topAnchor.constraint(equalTo: nameLabel1.bottomAnchor, constant: 0),
            descriptionLabel1.leftAnchor.constraint(equalTo: emoji1.rightAnchor, constant: 10)
        ])
        
        // Emoji + Description2
        let emoji2 = addEmojiButton(descriptions.testinfo_emoji2, 50)
        view.addSubview(emoji2)
        NSLayoutConstraint.activate([
            emoji2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 35),
            emoji2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        let nameLabel2 = addDescription(descriptions.testinfo_test2)
        let descriptionLabel2 = addDescription(descriptions.testinfo_description2)
        nameLabel2.font = UIFont(name: "AvenirNext-bold", size: UIFont.labelFontSize)
        descriptionLabel2.font = UIFont(name: "AvenirNext-regular", size: 15)
        view.addSubview(nameLabel2)
        view.addSubview(descriptionLabel2)
        NSLayoutConstraint.activate([
            nameLabel2.widthAnchor.constraint(equalToConstant: 350),
            nameLabel2.topAnchor.constraint(equalTo: descriptionLabel1.bottomAnchor, constant: 40),
            nameLabel2.leftAnchor.constraint(equalTo: emoji2.rightAnchor, constant: 10),
            
            descriptionLabel2.widthAnchor.constraint(equalToConstant: 350),
            descriptionLabel2.topAnchor.constraint(equalTo: nameLabel2.bottomAnchor, constant: 0),
            descriptionLabel2.leftAnchor.constraint(equalTo: emoji2.rightAnchor, constant: 10)
        ])
        
        
        let button1 = addButton(descriptions.testinfo_button1)
        button1.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        button1.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button1.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -130, right: 0)
        let buttonEmoji1 = addEmoji(descriptions.testinfo_emoji1, 80)
        view.addSubview(button1)
        view.addSubview(buttonEmoji1)
        NSLayoutConstraint.activate([
            button1.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 200),
            button1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button1.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            buttonEmoji1.centerXAnchor.constraint(equalTo: button1.centerXAnchor),
            buttonEmoji1.centerYAnchor.constraint(equalTo: button1.centerYAnchor, constant: -15)
        ])
        
        let button2 = addButton(descriptions.testinfo_button2)
        button2.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        button2.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button2.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -130, right: 0)
        let buttonEmoji2 = addEmoji(descriptions.testinfo_emoji2, 100)
        view.addSubview(button2)
        view.addSubview(buttonEmoji2)
        NSLayoutConstraint.activate([
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 200),
            button2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button2.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            
            buttonEmoji2.centerXAnchor.constraint(equalTo: button2.centerXAnchor),
            buttonEmoji2.centerYAnchor.constraint(equalTo: button2.centerYAnchor, constant: -15)
        ])
        
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        
        if sender.titleLabel?.text == descriptions.testinfo_button1 {
            self.navigationController?.pushViewController(SelfAssessmentViewController(), animated: true)

        } else {
            self.navigationController?.pushViewController(MMSEViewController(), animated: true)
        }
        
    }
}

class SelfAssessmentViewController: UIViewController {
    
    let questionList = data.assessment_questions
    
    let contentViewHeight = 2000
    let scrollView = UIScrollView()
    var checkboxes = [UIButton]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = customColor.tint
        self.navigationController?.navigationBar.backgroundColor = customColor.main
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.clipsToBounds = true
        self.title = "Self-Assessment Test"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        let view = addScrollContentView(height: 960)
        scrollView.contentSize = view.frame.size
        scrollView.flashScrollIndicators()
        scrollView.backgroundColor = customColor.main

        
        // Description
        let guideLabel = addDescription(descriptions.self.self_guide)
        view.addSubview(guideLabel)
        NSLayoutConstraint.activate([
            guideLabel.widthAnchor.constraint(equalToConstant: 400),
            guideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            guideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Divider
        let divider = addDivider()
        view.addSubview(divider)
        NSLayoutConstraint.activate([
            divider.widthAnchor.constraint(equalToConstant: 400),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 20),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        for i in 0...questionList.count-1 {
            let newCheckbox = addCheckBox(questionList[i])
            newCheckbox.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
            checkboxes.append(newCheckbox)
            view.addSubview(checkboxes[i])
            
            var upperObject: UIView
            var upperConstant: CGFloat
            
            // First checkbox
            if i == 0 {
                upperObject = divider
                upperConstant = 30
                
            } else {
                upperObject = checkboxes[i-1]
                upperConstant = 20
            }
            
            NSLayoutConstraint.activate([
                newCheckbox.topAnchor.constraint(equalTo: upperObject.bottomAnchor, constant: upperConstant),
                newCheckbox.leftAnchor.constraint(equalTo: upperObject.leftAnchor, constant: 0),
                newCheckbox.widthAnchor.constraint(lessThanOrEqualToConstant: 400),
                newCheckbox.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
        
        // Button
        let nextButton = addButton(descriptions.self_button)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 400),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.topAnchor.constraint(equalTo: checkboxes[checkboxes.count-1].bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        

        
        scrollView.addSubview(view)
       self.view = scrollView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)

           self.navigationController?.isNavigationBarHidden = true
       }
    
    
    // Checkbox aciton
    @objc func checkboxTapped(_ sender: UIButton) {
        let selected = sender.isSelected
        sender.isSelected = !selected
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        var score = 0
        for i in checkboxes {
            if i.isSelected {
                score += 1
            }
        }
        
        testData.testScore = score
        self.navigationController?.pushViewController(SelfAssessmentResultViewController(), animated: true)
    }
}

class SelfAssessmentResultViewController: UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let view = addView()
        let resultCode = getResultCode(testData.testScore)
        
        // title
        let titleLabel = addHeading(descriptions.selfresult_title[resultCode])
        titleLabel.backgroundColor = customColor.resultColor[resultCode]
        titleLabel.clipsToBounds = true
        titleLabel.layer.cornerRadius = 20
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 400),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
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
        let centerEmoji = addEmoji(descriptions.selfresult_emoji[resultCode], 130)
        view.addSubview(centerEmoji)
        NSLayoutConstraint.activate([
            centerEmoji.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerEmoji.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 30)
        ])
        
        // Description
        let introductionLabel = addDescription(descriptions.selfresult_introduciton[resultCode])
        introductionLabel.font = UIFont(name: "AvenirNext-bold", size: 20)
        introductionLabel.textAlignment = .center
        view.addSubview(introductionLabel)
        NSLayoutConstraint.activate([
            introductionLabel.widthAnchor.constraint(equalToConstant: 425),
            introductionLabel.topAnchor.constraint(equalTo: centerEmoji.bottomAnchor, constant: 20),
            introductionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Description
        let descriptionLabel = addDescription(descriptions.selfresult_Description[resultCode])
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.widthAnchor.constraint(equalToConstant: 400),
            descriptionLabel.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let button1 = addButton(descriptions.selfresult_button1)
        button1.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        button1.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: UIFont.labelFontSize)
        view.addSubview(button1)
        NSLayoutConstraint.activate([
            button1.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 50),
            button1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button1.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
        ])
        
        let button2 = addButton(descriptions.selfresult_button2)
        button2.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        button2.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: UIFont.labelFontSize)
        view.addSubview(button2)
        NSLayoutConstraint.activate([
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 50),
            button2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button2.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
        ])
        
        let conclusionLabel = addDescription(descriptions.selfresult_conclusion[resultCode])
        conclusionLabel.textAlignment = .center
        if resultCode == 2 {
            conclusionLabel.textColor = customColor.alertColor
        }
        conclusionLabel.font = UIFont(name: "AvenirNext-Bold", size: 25)
        view.addSubview(conclusionLabel)
        NSLayoutConstraint.activate([
            conclusionLabel.widthAnchor.constraint(equalToConstant: 450),
            conclusionLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            conclusionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        self.view = view
    }
    
    func getResultCode(_ score: Int) -> Int {
        if score >= 0 && score < 4 {
            return 0
        } else if score >= 4 && score < 7 {
            return 1
        } else {
            return 2
        }
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        
        if sender.titleLabel?.text == descriptions.testinfo_button1 {
            self.navigationController?.pushViewController(TitleViewController(), animated: true)

        } else {
            self.navigationController?.pushViewController(TestinfoViewController(), animated: true)
        }
    }
}



class MMSEViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = addView()
        
        
        let title = addHeading("MMSE")
        view.addSubview(title)
        
        self.view = view
    }
}

//Custom functions for UI
func addView() -> UIView {
    
    let viewRect = CGRect(x: 0, y: 0, width: 480, height: 720)
    let view = UIView(frame: viewRect)
    view.backgroundColor = customColor.main
    
    return view
}

func addScrollContentView(height: Int) -> UIView {
    
    let viewRect = CGRect(x: 0, y: 0, width: 480, height: height)
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
    centerEmoji.font = UIFont.systemFont(ofSize: CGFloat(size))
    
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
    nextButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: UIFont.labelFontSize)
    nextButton.setTitle(button, for: .normal)
    nextButton.setTitleColor(UIColor.white, for: .normal)
    nextButton.backgroundColor = customColor.tint
    nextButton.layer.cornerRadius = 10
    
    return nextButton
}

func addSkipButton(_ button: String) -> UIButton {
    let nextButton = UIButton()
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.titleLabel?.font = UIFont(name: "AvenirNext-regular", size: 13)
    nextButton.setTitle(button, for: .normal)
    nextButton.setTitleColor(UIColor.black, for: .normal)
    nextButton.layer.cornerRadius = 10
    
    return nextButton
}


func addDescription(_ description: String) -> UILabel {
    let descriptionLabel = UILabel()
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.text = description
    descriptionLabel.textColor = UIColor.black
    descriptionLabel.font = UIFont(name: "AvenirNext-regular", size: UIFont.labelFontSize)
    descriptionLabel.numberOfLines = 0
    
    return descriptionLabel
}

func addEmojiButton(_ emoji: String, _ size: Float) -> UIButton {
    let emojiButton = UIButton()
    emojiButton.translatesAutoresizingMaskIntoConstraints = false
    emojiButton.setTitle(emoji, for: .normal)
    emojiButton.titleLabel?.textAlignment = .center
    emojiButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(size))
    
    return emojiButton
}

func addCheckBox(_ title: String) -> UIButton{
    let button = UIButton()
    button.tintColor = .black
    button.setTitleColor(.black, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(customColor.defaultImage, for: .normal)
    button.setImage(customColor.checkedImage, for: .selected)
    button.setTitle(title, for: .normal)
    button.setTitle(title, for: .selected)
    button.titleLabel?.font = UIFont(name: "AvenirNext-regular", size: 16)
    button.titleLabel?.numberOfLines = 0
    button.contentHorizontalAlignment = .left
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    button.isSelected = false
    
    return button
}
