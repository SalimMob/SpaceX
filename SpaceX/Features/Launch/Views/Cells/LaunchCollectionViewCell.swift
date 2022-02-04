//
//  LaunchCollectionViewCell.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/3/22.
//

import UIKit
import SDWebImage

class LaunchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var launchImage: UIImageView!
    @IBOutlet private weak var indicatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupInterface()
        launchImage.image = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        launchImage.image = nil
    }
    
    func setupContent(model: LaunchModelDTO) {
        setNumber(number: (model.flightNumber)?.stringValue)
        setDate(date: model.dateUTC)
        setDetails(details: model.details)
        setImage(imageUrl: model.links?.flickr?.original?.first)
        if let autoUpdate = model.autoUpdate {
            setIndicator(autoUpdate: autoUpdate)
        }
    }
}

extension LaunchCollectionViewCell {
    
    private func setupInterface() {
        containerView.layer.cornerRadius = 10
    }
    
    private func setNumber(number: String?) {
        numberLabel.text = number
    }
    
    private func setDate(date: String?) {
        dateLabel.text = date
    }
    
    private func setDetails(details: String?) {
        detailsLabel.text = details
    }
    
    private func setImage(imageUrl: String?) {
        if let imageUrl = imageUrl {
            launchImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: Constants.Images.placeHolderImage)
        } else {
            launchImage.image = Constants.Images.placeHolderImage
        }
    }
    
    private func setIndicator(autoUpdate: Bool) {
        indicatorView.isHidden = !autoUpdate
    }
}
