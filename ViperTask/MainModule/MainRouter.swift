//
//  MainRouter.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 12/05/2019.
//

import UIKit

class MainRouter: MainRouterProtocol {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createTaskListModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "ViperTaskNavigation") as! UINavigationController
        guard let mainViewController = navController.topViewController as? MainViewController else { fatalError("Invalid View Controller") }
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interactor: MainInteractorInputProtocol = MainInteractor()
        let router = MainRouter()
        
        mainViewController.presenter = presenter
        presenter.view = mainViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return navController
    }
    
    func presentTaskDetailScreen(from view: MainViewProtocol, for task: Task) {
        // todo
    }
    
    
}
