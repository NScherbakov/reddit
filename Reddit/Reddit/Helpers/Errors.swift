//
//  Errors.swift
//  Reddit
//
//  Created by Nikolay on 16.02.2021.
//

import Foundation

enum RedditError: Error {
    case tryAgain
    case defaultError
}

extension RedditError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .tryAgain:
            return NSLocalizedString("Try again", comment: "Try again")
        case .defaultError:
            return NSLocalizedString("Oooopps", comment: "Oooopps")
        }
    }
}
