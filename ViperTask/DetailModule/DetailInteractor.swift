//
//  DetailInteractor.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 13/05/2019.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    
    var presenter: DetailInteractorOutputProtocol?
    var taskStore = TaskStore.shared
    var task: Task?
    
    func deleteTask() {
        guard let task = task else { return }
        taskStore.deleteTask(task)
        presenter?.didDeleteTask()
    }
    
    func editTask(title: String, content: String) {
        guard let task = task else { return }
        task.title = title
        task.content = content
        presenter?.didEditTask(task)
    }
    
    
}
