//
//  MainViewController.swift
//  QuizApp
//
//  Created by Văn Khánh Vương on 12/11/2021.
//

import UIKit

class MainViewController: UIViewController, MainViewModelEvent {
    func didBeginProcessing() { }
    
    func didFinishProcessing() { }
    
    lazy var viewModel: MainViewModelProtocol = MainViewModel(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel.getValueTestApi()
    }
}

