import Foundation
import UIKit

// Constants
public struct customColor {
    public static let main = #colorLiteral(red: 0.968627451, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
    public static let tint = #colorLiteral(red: 0.4470588235, green: 0.4392156863, blue: 0.4235294118, alpha: 1)
    public static let alertColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
}

public struct descriptions {
    public static let title_heading = "You should Care Dementia!"
    public static let title_emoji = "🧑‍⚕️"
    public static let title_button = "Should I?"
    
    public static let introduction_title = "First, What is Dementia?"
    public static let introduciton_emoji = "🧠"
    // Dememtia description from: https://www.alzint.org/about/
    public static let introduction_description1 = "Dementia is collection of symptoms that are caused by disorders affecting the brain and impact on memory, thinking, behaviour and emotion."
    public static let introduction_description2 = "The most common is Alzheimer’s disease, which affects 50-60% of people with dementia."
    public static let introduction_button = "Okay, I see"
    
    public static let statistics_title = "You might think Dementia is not common thing"
    public static let statistics_description = "How many people get Dementia by getting old?"
    public static let statistics_collectionDescription = "Slide to see how many people get dementia by getting old                                       (🥵 means people got Dementia)"
    public static let statistics_alert = "You can see, lots of Old people get Dementia"
    public static let statistics_button = "Old people get Dementia, But I'm not old"
    
    public static let awareness_title = "But our Parents and Grandparents are Old"
    public static let awareness_introduction = "Even young people can be related to Demantia"
    public static let awareness_guide = "(Guess why, and Click Emojis!)"
    public static let awareness_emoji1 = "👴🏻"
    public static let awareness_description1 = "If you have some old people to care in family, they can get Dementia"
    public static let awareness_emoji2 = "🤕"
    public static let awareness_description2 = "People have Dementia are vulnerable to fall accident and so on"
    public static let awareness_emoji3 = "🥲"
    public static let awareness_description3 = "People caring dementia patients have 1.7 times more depressive symptoms and 7 times more thinking of death"
    public static let awareness_conclusionEmoji = "🫂"
    public static let awareness_conclusionDescription = "Dementia is not only hard for Patient,               But also hard for FAMILY MEMBERS"
    public static let awareness_button = "But isn't dementia cureable and preventable?"
    
    public static let benefits_title = "Treatment and Early Diagnosis of Dementia is Important"
    public static let benefits_introduction = "Detecting Dementia is not worthless"
    public static let benefits_emoji1 = "⏳"
    public static let benefits_description1 = "Some dementia is completely curable if found and treated in early Stages"
    public static let benefits_emoji2 = "💊"
    public static let benefits_description2 = "Even it's not curable, proper medication can slow its Progress."
    public static let benefits_emoji3 = "👩‍🦽"
    public static let benefits_description3 = "People with dementia vulnerable to accidents can prevent accidents in advance"
    public static let benefits_emoji4 = "👨‍👩‍👧‍👦"
    public static let benefits_description4 = "Families can make long-term plans and be prepared in advance."
    public static let benefits_button = "I get it. Then how can I detect Dementia?"

    public static let testinfo_title = "Try 2 Ways of Dementia tests for you"
    public static let testinfo_introduction = "Most of us are not Psychiatrists.                                              So this app can help you testing Dementia"
    public static let testinfo_guide = "Try testing yourself or your family members"
    public static let testinfo_emoji1 = "✅"
    public static let testinfo_test1 = "1. Self-Assessment Test"
    public static let testinfo_description1 = "Check symptoms using life-experiences related questions common people with dementia."
    public static let testinfo_emoji2 = "👨🏻‍⚕️"
    public static let testinfo_test2 = "2. Mini-Mental State Examination"
    public static let testinfo_description2 = "Methods psychiatrists use for screening dementia.                        This app provide simplified version"
    
    
}

public struct data {
    public static let prevelence = [
        [false, false, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, false, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, true, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, true, true, false, false, false, false, false, false, false, false, false, false]
    ]
    public static let prevelence_range = [
        "Under 65 |  2% of prevelence",
        "65 ~ 74  |  4% of prevelence",
        "75 ~ 79  |  12% of prevelence",
        "80 ~ 84  |  20% of prevelence",
        "Over 85  |  40% of prevelence"
    ]

}
