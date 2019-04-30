//
//  DetailInteractor.swift
//  DesafioMyFreeComm-iOS
//
//  Created by Hundily Cerqueira Silva on 29/04/19.
//  Copyright (c) 2019 Hundily Cerqueira Silva. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailBusinessLogic
{
    func doSomething(request: Detail.Something.Request)
    func getRepositoryDetail()
}

protocol DetailDataStore
{
  var repositoryDetail: Home.Something.Items? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore
{
    
  var repositoryDetail: Home.Something.Items?
  var presenter: DetailPresentationLogic?
  var worker: DetailWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Detail.Something.Request)
  {
    worker = DetailWorker()
    worker?.doSomeWork()
    
    let response = Detail.Something.Response()
    presenter?.presentSomething(response: response)
  }
    
    func getRepositoryDetail() {
        print("entrou")
        if let repositoryDetail = self.repositoryDetail {
            print("repositoryDetail", repositoryDetail)
            self.presenter?.displayRepositoryDetail(repositoryDetail: repositoryDetail)
        }
    }
}
