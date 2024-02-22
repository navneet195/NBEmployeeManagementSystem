//
//  SessionInterval.swift
//  NBEmployeeManagementSystem
//
//  Created by Navnit Baldha on 22/02/24.
//

import Foundation
import Combine

class SessionInterval: ObservableObject {

   // MARK: Variables & constants
    static let shared = SessionInterval()
    private let cancellable: AnyCancellable?
    let intervalPublisher = Timer.TimerPublisher(
        interval: 1800.0, /// 30 min time interval for auto call
        runLoop: .main,
        mode: .default)

    // MARK: init & deinit
    init() {
        cancellable = intervalPublisher.connect() as? AnyCancellable
    }

    deinit {
        cancellable?.cancel()
    }
}
