//
//  RedditCell.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

final class RedditCell: UITableViewCell {

    private enum Constant {
        static let cornerRadius: CGFloat = 8
    }
    
    // MARK: - Outlets
    
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var backContentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var commentsCountLabel: UILabel!
    @IBOutlet private weak var hoursAgoLabel: UILabel!
   
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.image = nil
    }
    
    // MARK: - PublicMethod
    
    func update(with post: RedditPost?) {
        guard let post = post else { return }
        
        avatarImageView.loadImageWith(url: post.thumbnailURL)
        titleLabel.text = post.title
        commentsCountLabel.text = "Comments: \(post.commentsCount)"
        authorLabel.text = "Author: \(post.author)"
        hoursAgoLabel.text = "\(post.createdUTC.toHoursAgo()) hours ago"
    }
}

// MARK: -  Private

private extension RedditCell {
    func setupView() {
        backView.layer.cornerRadius = Constant.cornerRadius
        backView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = Constant.cornerRadius
    }
}
