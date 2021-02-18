//
//  AppCoordinator.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

extension UIImageView {
    func loadImageWith(url urlString : String) {
        guard let url = URL(string: urlString) else {
            return
        }

        ImageLoader.loadImage(with: url) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
