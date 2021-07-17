//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        newsImageView.image = nil
    }
    func update(data: NewsModel) {
        autherLabel.text = "\(data.byLine) / \(data.publishedDate.formatedDate())"
        titleLabel.text = data.title
        if let firstMedia = data.media.first,
           let metaData = firstMedia.metaData.last  {
            newsImageView.imageFromUrl(metaData.url)
        }
    }
}
