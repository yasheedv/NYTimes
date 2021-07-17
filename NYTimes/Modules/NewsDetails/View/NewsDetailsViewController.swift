//
//  NewsDetailsViewController.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuther: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    var viewModel: NewsDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.backButtonDisplayMode = .minimal
        // Do any additional setup after loading the view.
    }
    private func updateUI() {
        title = viewModel.title()
        newsTitle.text = viewModel.title()
        newsAuther.text = viewModel.auther()
        newsContent.text = viewModel.content()
        if let imageURL = viewModel.imageURL() {
            imageView.imageFromUrl(imageURL)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
