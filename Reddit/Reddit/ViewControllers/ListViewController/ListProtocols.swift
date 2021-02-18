//
//  ListProtocols.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

protocol ListViewOutput: class {
    func viewDidLoad()
    func itemsCount() -> Int
    func itemAt(index: IndexPath) -> RedditPost
    func refresh()
    func isStartLoadingFrom(index: IndexPath) -> Bool
    func didSelect(index: IndexPath)
    func viewWillAppear()
}

protocol ListViewInput: class {
    func showLoader()
    func hideLoader()
    func reloadData()
    func show(message: String)
}

