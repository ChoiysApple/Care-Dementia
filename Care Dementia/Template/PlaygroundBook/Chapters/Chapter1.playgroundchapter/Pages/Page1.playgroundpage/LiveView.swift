//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import BookCore
import PlaygroundSupport

// Instantiate a new instance of the live view from BookCore and pass it to PlaygroundSupport.

let storyboard = UIStoryboard(name: "MainView", bundle: nil)

guard let viewController = storyboard.instantiateInitialViewController() else {
    fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
}

guard let liveViewController = viewController as? MainViewController else {
    fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
}

PlaygroundPage.current.liveView = liveViewController
