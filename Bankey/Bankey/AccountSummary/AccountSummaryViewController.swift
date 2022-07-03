//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Harun Gunes on 22/05/2022.
//

import UIKit

class AccountSummaryViewController: UIViewController {
  
  var profile: Profile?
  var accountCellViewModels: [AccountSummaryCell.AccountCellViewModel] = []
  var header = AccountSummaryHeaderView(frame: .zero)
  var accounts: [Account] = []
  
  var tableView = UITableView()
  
  let refreshControl = UIRefreshControl()
  
  var isLoaded = false
  
  lazy var logoutButton: UIBarButtonItem = {
    let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
    barButtonItem.tintColor = .label
    return barButtonItem
  }()
  
  @objc func logoutTapped() {
    NotificationCenter.default.post(name: .logout, object: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
}

extension AccountSummaryViewController {
  private func setup() {
    setupTableView()
    setupTableHeaderView()
    setupRefreshControl()
    setupSkeletons()
    fetchData()
    
    navigationItem.rightBarButtonItem = logoutButton
  }
  
  private func setupTableView() {
    tableView.backgroundColor = appColor
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
    tableView.register(SkeletonCell.self, forCellReuseIdentifier: SkeletonCell.reuseID)
    tableView.rowHeight = AccountSummaryCell.rowHeight
    tableView.tableFooterView = UIView()
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  
  private func setupTableHeaderView() {
    var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    size.width = UIScreen.main.bounds.width
    header.frame.size = size
    
    tableView.tableHeaderView = header
  }
  
  
  private func setupRefreshControl() {
    refreshControl.tintColor = appColor
    refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  @objc func pullToRefresh() {
    fetchData()
  }
  
  
  private func setupSkeletons() {
    let row = Account.makeSkeleton()
    
    accounts = Array(repeating: row, count: 10)
    
    configureTableCells(with: accounts)
  }
}

extension AccountSummaryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard !accountCellViewModels.isEmpty else { return UITableViewCell() }
    let account = accountCellViewModels[indexPath.row]
    
    if isLoaded {
      let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
      cell.configure(with: account)
      return cell
    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonCell.reuseID, for: indexPath) as! SkeletonCell
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return accountCellViewModels.count
  }
}

extension AccountSummaryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}


// MARK: - Networking
extension AccountSummaryViewController {
  private func fetchData() {
    
    let group = DispatchGroup()
    let userID = String(Int.random(in: 1..<4))
    
    group.enter()
    fetchProfile(forUserId: userID) { result in
      switch result {
      case .success(let profile):
        self.profile = profile
        self.configureTableHeaderView(with: profile)
      case .failure(let error):
        print(error.localizedDescription)
      }
      
      group.leave()
    }
    
    group.enter()
    fetchAccounts(forUserId: userID) { result in
      switch result {
      case .success(let accounts):
        self.accounts = accounts
        self.configureTableCells(with: accounts)
      case .failure(let error):
        print(error.localizedDescription)
      }
      group.leave()
    }
    
    group.notify(queue: .main) {
      self.isLoaded = true
      self.tableView.reloadData()
      self.tableView.refreshControl?.endRefreshing()
    }
  }
  
  
  
  func configureTableHeaderView(with profile: Profile) {
    let vm = AccountSummaryHeaderView.HeaderViewModel(name: "Harun", greeting: "Welcome", date: Date())
    header.configureViewModel(viewModel: vm)
  }
  
  
  private func configureTableCells(with accounts: [Account]) {
    accountCellViewModels = accounts.map {
      AccountSummaryCell.AccountCellViewModel(accountType: $0.type,
                                              accountName: $0.name,
                                              balance: $0.amount)
    }
  }
}
