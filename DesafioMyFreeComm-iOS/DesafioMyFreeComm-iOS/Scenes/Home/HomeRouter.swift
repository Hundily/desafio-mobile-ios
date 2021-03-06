//
//  HomeRouter.swift
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

@objc protocol HomeRoutingLogic
{
  func routeTosegueDetail(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing
{
  var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing
{
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?

    func routeTosegueDetail(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! DetailViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDetailData(source: dataStore!, destination: &destinationDS)
        }
    }
    
    func passDetailData(source: HomeDataStore, destination: inout DetailDataStore) {
        print(destination.repositoryDetail)
        destination.repositoryDetail = source.repositoryDetail
    }
}
