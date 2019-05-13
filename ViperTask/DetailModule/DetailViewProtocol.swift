//
//  DetailViewProtocol.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 13/05/2019.
//

import UIKit

protocol DetailViewProtocol: class {
    var presenter: DetailPresenterProtocol? { set get }
    
    // Presenter -> View
    func showTask(_ task: Task)
}

protocol DetailPresenterProtocol: class {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol { get set }
    var roouter: DetailRouterProotocol { get set }
    
    // View -> Presenter
    func viewDidLoad()
    func editTask(title: String, content: String)
    func deleteTask()
}

protocol DetailInteractorInputProtocol: class {
    var presenter: DetailInteractorOutputProtocol? { get set }
    var task: Task? { get set }
    
    // Presenter -> Interactor
    func deleteTask()
    func didEditTask(title: String, content: String)
}

protocol DetailInteractorOutputProtocol: class {
    // Interactor -> Presenter
    func didDeleteTask()
    func didEditTask(_ task: Task)
}

protocol DetailRouterProotocol: class {
    static func createTaskDetailRouterModule(with task: Task) -> UIViewController
    
    // Presenter -> Router
    func navigateBackToMainViewController(from view: DetailViewProtocol)
}
