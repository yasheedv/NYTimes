//
//  NewsViewController.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = NewsHomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NY Times Most Popular"
        tableView.register(cellType: NewsTableViewCell.self)
        bindUI()
        viewModel.getNews()
        
        // Do any additional setup after loading the view.
    }
    private func bindUI() {
        viewModel.errorHandler = { [weak self] error in
            guard let _ = self else { return }
            UIAlertController.show(title: "Sorry", message: error)
        }
        viewModel.uiUpdateHandler = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsDetailsViewController {
            destination.viewModel = viewModel.newsDetailsViewModel()
        }
    }
    
}
// MArK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsTableViewCell.self,
                                                 for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .none
        let news = viewModel.newsFor(indexPath)
        cell.update(data: news)
        return cell
    }
}
// MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.newsSelected(indexPath)
        performSegue(to: NewsDetailsViewController.self)
    }
}
