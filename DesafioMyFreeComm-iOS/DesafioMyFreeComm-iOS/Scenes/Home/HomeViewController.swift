//
//  HomeViewController.swift
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
import SDWebImage

protocol HomeDisplayLogic: class
{
//  func displaySomething(viewModel: Home.Something.ViewModel)
    func displayTableData(data: [Home.Something.Items])
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    showIndicator(withTitle: "Carregando", and: "")
    tableGit.delegate = self
    tableGit.dataSource = self
    
    setTableView()
    getTableData()
  }
  
  // MARK: Do something
    var arrayTableData: [Home.Something.Items] = []
    @IBOutlet weak var tableGit: UITableView!
    
    func getTableData() {
        interactor?.getTableDataInterector()
//        hideIndicator()
    }
    
    func setTableView() {
        tableGit.register(UINib(nibName: "HomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "homeCellGit")
    }
    
    func displayTableData(data: [Home.Something.Items]) {
        hideIndicator()
        self.arrayTableData = data
        tableGit.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCellGit") as! HomeTableViewCell
        
        if let forks_number = arrayTableData[indexPath.row].forks_count,
            let start_number = arrayTableData[indexPath.row].stargazers_count {
            cell.labelNumberForks.text = "\(forks_number)"
            cell.labelNumberStart.text = "\(start_number)"
        }
        
        cell.labelNewRepository.text = arrayTableData[indexPath.row].name
        cell.labelNameUser.text = arrayTableData[indexPath.row].owner?.login
        
        cell.labelUserNameAndLastName.text = arrayTableData[indexPath.row].full_name
        cell.labelRepositoryDiscription.text = arrayTableData[indexPath.row].description
        cell.imageAvatar.sd_setImage(with: URL(string: arrayTableData[indexPath.row].owner?.avatar_url ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 176
    }
    
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(arrayTableData[indexPath.row])
        self.performSegue(withIdentifier: "segueDetail", sender: arrayTableData[indexPath.row])
    }
}
