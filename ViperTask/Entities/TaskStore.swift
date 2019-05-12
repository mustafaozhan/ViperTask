//
//  TaskStore.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 12/05/2019.
//

import Foundation

class TaskStore {
    public static let shared = TaskStore()
    
    public private (set) var tasks: [Task] = []
    
    func addTask(_ task:Task){
        tasks.append(task)
    }
    
    func deleteTask(_ task:Task){
        if let index = tasks.firstIndex(where: { $0 === task }){
            tasks.remove(at: index)
        }
    }
}
