//
//  DetailRouter.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 13/05/2019.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
  
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createTaskDetailRouterModule(with task: Task) -> UIViewController {
        
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("Invalid view controller type")
        }
        
        let presenter: DetailPresenter & DetailInteractorOutputProtocol = DetailPresenter()
        detailVC.presenter = presenter
        presenter.view = detailVC
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        interactor.task = task
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router: DetailRouterProtocol = DetailRouter()
        presenter.router = router
        
        return detailVC
    }
    
    func navigateBackToMainViewController(from view: DetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
}
