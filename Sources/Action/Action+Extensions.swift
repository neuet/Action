//
//  Action+Extensions.swift
//  Action
//
//  Created by Obi Bob on 01.03.19.
//  Copyright © 2019 CezaryKopacz. All rights reserved.
//

import Foundation
import RxSwift

extension Action {
    /// Filters out `notEnabled` errors and returns
    /// only underlying error from `ActionError`
    public var underlyingError: Observable<Error> {
        return errors.flatMap { actionError -> Observable<Error> in
            guard case .underlyingError(let error) = actionError else {
                return Observable.empty()
            }
            return Observable.just(error)
        }
    }
}

extension Action where Input == Void {
    /// use to trigger an action.
    @discardableResult
    public func execute() -> Observable<Element> {
        return execute(())
    }
}
