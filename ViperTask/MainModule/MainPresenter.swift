//
//  MainPresenter.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 12/05/2019.
//

import UIKit

class MainPresenter:MainPresenterProtocol{

    
    var view: MainViewProtocol?
    
    var interactor: MainInteractorInputProtocol?
    
    var router: MainRouterProtocol?
    
    func viewWillAppear() {
        interactor?.retrieveTasks()
    }
    
    func addTask(_ task: Task) {
       interactor?.saveTask(task)
    }
    
    func removeTask(_ task: Task) {
        interactor?.deleteTask(task)
    }
    
    func showTaskDetail(_ task: Task) {
        guard let view = view else { return }
        router?.presentTaskDetailScreen(from: view, for: task)
    }
}

extension MainPresenter: MainInteractorOutputProtocol{
    func didAddTask(_ task: Task) {
       interactor?.retrieveTasks()
    }
    
    func didRemoveTask(_ task: Task) {
        interactor?.retrieveTasks()
    }
    
    func didRetrieveTasks(_ tasks: [Task]) {
        view?.showTasks(tasks)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
    
}
