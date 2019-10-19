//
//  UpdateStore.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/19.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    let didChange = PassthroughSubject<Void, Never>()
    
    @Published var updates: [Update] = []
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
