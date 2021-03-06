//
//  HomePresenter.swift
//  DesafioMyFreeComm-iOS
//
//  Created by Hundily Cerqueira Silva on 28/04/19.
//  Copyright (c) 2019 Hundily Cerqueira Silva. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
//  func presentSomething(response: Home.Something.Response)
    func displayTableData(response: [Home.Something.Items])
}

class HomePresenter: HomePresentationLogic
{

    
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
//  func presentSomething(response: Home.Something.Response)
//  {
//    let viewModel = Home.Something.ViewModel()
//    viewController?.displaySomething(viewModel: viewModel)
//  }
    
    func displayTableData(response: [Home.Something.Items]) {
        viewController?.displayTableData(data: response)
    }
}
