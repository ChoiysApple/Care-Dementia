import Foundation
import UIKit

// Constants
public struct customColor {
    public static let main = #colorLiteral(red: 0.968627451, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
    public static let tint = #colorLiteral(red: 0.4470588235, green: 0.4392156863, blue: 0.4235294118, alpha: 1)
    public static let alertColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    public static let resultColor = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)]
    
    public static let defaultImage = UIImage(systemName: "checkmark.square")
    public static let checkedImage = UIImage(systemName: "checkmark.square.fill")
    public static let speechImage = UIImage(systemName: "mic.circle.fill")
}

public struct descriptions {
    public static let title_heading = "You should Care Dementia!"
    public static let title_emoji = "🧑‍⚕️"
    public static let title_button = "Start Caring Dementia"
    public static let title_skipButton = "I know Dementia. Bring me to test >"
    
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
    public static let testinfo_test2 = "2. Mini-Mental State Examination (MMSE)"
    public static let testinfo_description2 = "Methods psychiatrists use for screening dementia.                        This app provide simplified version"
    public static let testinfo_button1 = "Start Self-Assessment"
    public static let testinfo_button2 = "Start MMSE"
    
    public static let self_guide = "Please read each question carefully, and indicate how often you have experienced the same or similar challenges in the past few months."
    public static let self_button = "Finish test and check result"
    
    public static let selfresult_title = ["Little or No Indication of Dementia", "Mild Indication of Dementia", "Strong Indication of Dementia"]
    public static let selfresult_emoji = ["✅", "⚠️", "‼️"]
    public static let selfresult_introduciton = ["Suspect no cognitive impairment", "Suspect mild cognitive impairment, which is at risk of dementia.", "Suspect high possibility of dementia now."]
    public static let selfresult_Description = ["It doesn't look like dementia. But still be aware of risk of Dementia", "Hardness cognitive impairment is not dementia, but a significantly reduced level of memory compared to other people with similar age and educational background, and the rate of progression to dementia is about 10-15%.", "Seems like dementia. Highly suggest to get Dementia early selection test"]
    public static let selfresult_conclusion = ["Don't have to worry about dementia right now.", "Recommand to get a consultation on your current condition.", "Must get a consultation on your current condition."]
    public static let selfresult_button1 = "To title page"
    public static let selfresult_button2 = "Test Selection"
    
    public static let mmse_title = "Simplified MMSE Test"
    public static let mmse_introduciton = "I'm going to ask you a few questions to learn about memory and concentration. Some of the questions are easy, but some may be difficult. You can do as much as you can."
    public static let mmse_guide = "Every questions will spoken in voice.                       You can hear it again pressing button below"
    public static let mmse_button = "Start Test"
}

public struct data {
    public static let prevelence = [
        [false, false, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, false, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, false, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, true, false, false, false, false, false, false, false, false, false, false, false],
        [true, true, true, true, false, false, false, false, false, false, false, false, false, false]
    ]
    
    // Statistic data from "Dementia News"
    public static let prevelence_range = [
        "Under 65 |  2% of prevelence",
        "65 ~ 74  |  4% of prevelence",
        "75 ~ 79  |  12% of prevelence",
        "80 ~ 84  |  20% of prevelence",
        "Over 85  |  40% of prevelence"
    ]
    
    // Questions from https://www.psycom.net/dementia-test/
    public static let assessment_questions = [
            "Do you ever forget information that you have learned recently?",
            "Do you have to ask for the same information again or need reminder notes?",
            "Do you have trouble following instructions, like a recipe or directions?",
            "Do you struggle to keep track of finances or pay bills on time?",
            "Do you experience visual problems, such as trouble with reading or judging distance or color?",
            "Do you find yourself becoming confused in the middle of a conversation and having to stop?",
            "Do you struggle to remember words, date, or events?",
            "Do you lose things and/or sense that people have stolen them?",
            "Do you struggle to remember to keep yourself clean or practice good hygiene?",
            "Have you or others noticed changes in your personality, such as becoming easily upset or anxious?"
        ]
    
    public struct MMSE_questions {
        // First Strings of each arrys are title of question group
        public static let time = ["What year is it this year?", "What season is it now?", "What's today's date?", "What day is it today?", "What month is it now?"]
        public static let memory = ["I'll tell you the names of the three items. Listen until the end and name all three things.And in a few minutes, we'll ask you the names of those three objects again, so remember the names of the objects you've heard.", "Please tell me the names of the three items I told you to remember a while ago."]
        public static let attention = ["How much is it if you subtract 7 from 100?", "much is it if I subtract 7 from there?"]
        public static let name = "What is this called?"
    }
}

public struct testData {
    public static var testScore = 0
}
