//
//  CritterAnimatable.swift
//  LoginCritter
//
//  Created by Cheng Xiaoyu on 4/15/18.
//  Copyright © 2018 Cheng Xiaoyu. All rights reserved.
//

import UIKit

typealias SavedState = () -> Void

protocol CritterAnimatable {
    func currentState() -> SavedState
    func applyActiveStartState()
    func applyActiveEndState()
    func applyInactiveState()
    func applyPeekState()
    func applyUnPeekState()
}
//只给遵守CritterAnimatable 协议的UIView 添加了拓展
//强大的协议拓展  可以给协议添加默认实现   面向协议编程的基础
extension CritterAnimatable where Self: UIView {
    
    func currentState() -> SavedState {
        let currentState = layer.transform
        return {
            self.layer.transform = currentState
        }
    }

    func applyActiveStartState() { }

    func applyActiveEndState() { }
    
    func applyInactiveState() {
        layer.transform = .identity
    }

    func applyPeekState() { }

    func applyUnPeekState() { }
}

extension Sequence where Iterator.Element == CritterAnimatable {

    func applyActiveStartState() {
        forEach { $0.applyActiveStartState() }
    }

    func applyActiveEndState() {
        forEach { $0.applyActiveEndState() }
    }

    func applyInactiveState() {
        forEach { $0.applyInactiveState() }
    }

    func applyPeekState() {
        forEach { $0.applyPeekState() }
    }

    func applyUnPeekState() {
        forEach { $0.applyUnPeekState() }
    }
}
