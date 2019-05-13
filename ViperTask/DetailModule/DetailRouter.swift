//
//  DetailRouter.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 13/05/2019.
//

import UIKit

class DetailRouter {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createTaskDetailRouterModule(with todo: Task) -> UIViewController {
        
        guard let taskDetailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("Invalid view controller type")
        }
        
        // todo
        
        return taskDetailVC
    }
}
