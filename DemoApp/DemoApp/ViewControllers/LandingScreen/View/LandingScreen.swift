//
//  LandingScreen.swift
//  DemoApp
//
//  Created by NarberalGamma on 30.04.2024.
//

import UIKit

protocol LandingScreenViewProtocol {
    func reloadData()
}

class LandingScreen: UIViewController {
    var presenter: LandingScreenPresenterProtocol? = nil
    
    private var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
        presenter?.fetchData()
    }
    
    func buildUI() {
        tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        self.view.addSubview(tableView)
    }
    
    @objc func refresh() {
        presenter?.fetchData()
        refreshControl.endRefreshing()
    }
}

extension LandingScreen: LandingScreenViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

extension LandingScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.itemsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter?.item(at: indexPath.row)
        return cell
    }
}
