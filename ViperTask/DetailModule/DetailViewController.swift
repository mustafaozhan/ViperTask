//
//  DetailViewController.swift
//  ViperTask
//
//  Created by Mustafa Ozhan on 13/05/2019.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        presenter?.deleteTask()
    }
    
    @IBAction func editTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Edit Task Item", message: "Enter title and content", preferredStyle: .alert)
        
        alertController.addTextField { $0.text = self.titleLabel.text }
        alertController.addTextField { $0.text = self.contentLabel.text }
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self](_) in
            let titleText = alertController.textFields![0].text ?? ""
            let contentText = alertController.textFields![1].text ?? ""
            guard !titleText.isEmpty else { return }
            self?.presenter?.editTask(title: titleText, content: contentText)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    
    }
    
}

extension DetailViewController: DetailViewProtocol{
    
    func showTask(_ task: Task) {
        titleLabel.text = task.title
        contentLabel.text = task.content
    }
    
}

