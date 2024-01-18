//
//  ListModel.swift
//  Sweety
//
//  Created by 성현주 on 1/16/24.
//

import SwiftUI

class ListModel: ObservableObject {
    
    @Published var dataArray: [String] = [] {
        didSet {
            saveData()
        }
    }
    
    private let dataKey = "열려라참깨!"
    
    init() {
        loadData()
    }
    
    private func saveData() {
        UserDefaults.standard.set(dataArray, forKey: dataKey)
    }
    
    private func loadData() {
        if let savedData = UserDefaults.standard.array(forKey: dataKey) as? [String] {
            dataArray = savedData
        }
    }
}
