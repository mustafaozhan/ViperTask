//
//  MainInteractor.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 12/05/2019.
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    weak var presenter: MainInteractorOutputProtocol?
    var taskStore = TaskStore.shared
    var tasks: [Task] {
        return taskStore.tasks
    }
    
    func retrieveTasks() {
        presenter?.didRetrieveTasks(tasks)
    }
    
    func saveTask(_ task: Task) {
        taskStore.addTask(task)
        presenter?.didAddTask(task)
    }
    
    func deleteTask(_ task: Task) {
        taskStore.deleteTask(task)
        presenter?.didRemoveTask(task)
    }
    
}
