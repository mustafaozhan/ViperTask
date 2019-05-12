//
//  MainViewProtocol.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 12/05/2019.
//

import UIKit

protocol MainViewProtocol: class {
    var presenter: MainPresenterProtocol? { get set }
    
    // Presenter -> View
    func showTasks(_ tasks: [Task])
    func showErrorMessage(_ message: String)
}

protocol MainPresenterProtocol: class{
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    // View -> Presenter
    func viewWillAppear()
    func showTaskDetail(_ task: Task)
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
}

protocol MainInteractorInputProtocol: class {
    var presenter: MainInteractorOutputProtocol? { get set }
    
    // Presenter -> Interactor
    func retrieveTasks()
    func saveTask(_ task: Task)
    func deleteTask(_ task: Task)
}

protocol MainInteractorOutputProtocol: class{
    // Interactor -> Presenter
    func didAddTask(_ task: Task)
    func didRemoveTask(_ task: Task)
    func didRetrieveTasks(_ tasks: [Task])
    func onError(message: String)
}

protocol MainRouterProtocol: class {
    static func createTaskListModule() -> UIViewController
    
    func presentTaskDetailScreen(from view: MainViewProtocol, for task: Task)
}
