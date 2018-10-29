# challengeKobe

This project uses CocoaPods. Please use "pod install" at the project root folder.
The code architecture is MVC.

# Pods for ChallengeKobe
#Network
pod 'Alamofire'#, '~> 4.7'
Alamofire is used to make requests in a simple way.
pod 'AlamofireObjectMapper'#, '~> 5.0'
AlamofireObjectMapper is used to map the  json from the api into a model in a simple way
pod 'AlamofireImage', '~> 3.4'
AlamofireImage is used to make asynchonous request for images. It also handles image caching, so it prevents make unnecessary downloads all the time and makes the app runs so much faster
//  UIView+Extension.swift
//  Created by Bishal Ghimire on 4/30/16.
Its a simple extension that adds border and shadow as IBDesignables to the storyboard editor
