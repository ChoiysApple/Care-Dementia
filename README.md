# Care Demantia
Simple interactive educational app with Swift Playgorunds

</br>

## Contents

### 1. Introduction 
<img src="https://user-images.githubusercontent.com/43776784/154182109-c972e594-116c-4eda-a9e1-275c421a248f.png" width="19%" alt="this was image"><img src="https://user-images.githubusercontent.com/43776784/154182117-997a8d13-0713-4e57-9524-a65cf45388bc.png" width="19%" alt="this was image">
<img src="https://user-images.githubusercontent.com/43776784/154182119-4f2449ab-1231-4408-a8e4-d511076493b7.gif" width="19%" alt="this was image">
<img src="https://user-images.githubusercontent.com/43776784/154182122-2ae224c4-74d9-4da9-aa71-326d29a189be.gif" width="19%" alt="this was image">
<img src="https://user-images.githubusercontent.com/43776784/154182125-60b63e7d-9c02-4b4e-ab58-27bff9387e79.gif" width="19%" alt="this was image">
### 2. Simple Dementia Test
<img src="https://user-images.githubusercontent.com/43776784/154182128-b160c567-969b-474a-bac5-5aed8d402e31.png" width="19%" alt="this was image"><img src="https://user-images.githubusercontent.com/43776784/154182130-63e64ca2-68fe-45e3-b324-965e0e66d164.png" width="19%" alt="this was image">
<img src="https://user-images.githubusercontent.com/43776784/154182133-4846ff0f-d1ce-4494-84c5-8939f4710011.png" width="19%" alt="this was image">
<img src="https://user-images.githubusercontent.com/43776784/154182134-65a7e43f-2a50-4f55-b161-00dcf7b57a44.png" width="19%" alt="this was image">
<img src="https://user-images.githubusercontent.com/43776784/154182136-987f7bb4-92b5-44de-a948-ab2964611b8f.png" width="19%" alt="this was image">

</br>

## Tech Stack
- UIKit
- Swift 5

</br>

### Text to Speech 
Used `AVFoundation`
```swift
  func textToSpeech(_ text: String){
    let synthesizer = AVSpeechSynthesizer()
    let utterance = AVSpeechUtterance(string: text)

    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    utterance.rate = 0.5
    synthesizer.speak(utterance)
}
```
</br>

## Design 
- Main Font: `AvenirNext`
- Background Color: `#colorLiteral(red: 0.968627451, green: 0.9647058824, blue: 0.9529411765, alpha: 1)`
- Tint Color: `#colorLiteral(red: 0.968627451, green: 0.9647058824, blue: 0.9529411765, alpha: 1)`
</br>

## Information Sources
- Introfuction: [Alzheimer's Disease International](https://www.alzint.org/about/)
- Demetia Test: [MMSE](https://en.wikipedia.org/wiki/Mini–Mental_State_Examination) test, Self Assessment - [Psycom](https://www.psycom.net/dementia-test/)
