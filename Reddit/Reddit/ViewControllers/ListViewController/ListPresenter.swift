//
//  ListPresenter.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

final class ListPresenter {
    
    private struct Constants {
        static let limit = 30
        static let startToPagination = 10
    }
    
    weak var view: ListViewInput?
    
    private let router: ListRouter
    private let postRequests: PostRequests
    private var currentLimit = 30
    private var posts: [RedditPost] = []
    
    init(router: ListRouter, postRequest: PostRequests) {
        self.router = router
        self.postRequests = postRequest
    }
}

// MARK: - ListViewOutput

extension ListPresenter: ListViewOutput {
    func itemsCount() -> Int {
        return posts.count
    }
    
    func itemAt(index: IndexPath) -> RedditPost {
        return posts[index.row]
    }
    
    func viewDidLoad() {
        view?.showLoader()
        getPosts()
    }
    
    func refresh() {
        currentLimit = Constants.limit
        getPosts()
    }
    
    func isStartLoadingFrom(index: IndexPath) -> Bool {
        let shouldStart = currentLimit - Constants.startToPagination < index.row
        if shouldStart {
            currentLimit += Constants.limit
            getPosts(pagination: true)
        }
        
        return shouldStart
    }
    
    func didSelect(index: IndexPath) {
        guard let url = URL(string: posts[index.row].thumbnailURL) else {
            view?.show(message: RedditError.defaultError.localizedDescription)
            return
        }
        router.showImageWith(url: url)
    }
    
    func viewWillAppear() {
        Restoration.shared.url = nil
    }
}

// MARK: Private

private extension ListPresenter {
    func getPosts(pagination: Bool = false) {
        postRequests.getPosts(limit: currentLimit) { [weak self] posts in
            if pagination {
                self?.posts.append(contentsOf: posts)
            } else {
                self?.posts = posts
            }
            DispatchQueue.main.async {
                self?.view?.hideLoader()
                self?.view?.reloadData()
            }
        } failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.view?.hideLoader()
                if let error = error {
                    self?.view?.show(message: error.localizedDescription)
                }
            }
        }
    }
}
