//
//  RedditPhotoProtocol.swift
//  Reddit
//
//  Created by Nikolay on 17.02.2021.
//

import UIKit

protocol RedditPhotoViewOutput: class {
    func save(image: UIImage?)
}

protocol RedditPhotoViewInput: class {
    func showLoader()
    func hideLoader()
    func show(message: String)
    func show(image: UIImage)
}
