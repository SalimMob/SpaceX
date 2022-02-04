//
//  Reactive+Loader.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
    public var isLoading: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                vc.view.showLoader()
            } else {
                vc.view.hideLoader()
            }
        })
    }
}
