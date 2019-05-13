//
//  DetailPresenter.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 13/05/2019.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {    
    
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    func viewDidLoad() {
        if let task = interactor?.task {
            view?.showTask(task)
        }
    }
    
    func editTask(title: String, content: String) {
        interactor?.editTask(title: title, content: content)
    }
    
    func deleteTask() {
        interactor?.deleteTask()
    }
    
}

extension  DetailPresenter: DetailInteractorOutputProtocol {
    func didDeleteTask() {
        if let view = view {
            router?.navigateBackToMainViewController(from: view)
        }
    }
    
    func didEditTask(_ task: Task) {
        view?.showTask(task)
    }
    
    
}
