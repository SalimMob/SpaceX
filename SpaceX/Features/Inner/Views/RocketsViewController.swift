//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/3/22.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class RocketsViewController: UIViewController {

    // MARK: Instance variables
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var rocketImage: UIImageView!
    @IBOutlet private weak var rocketNameLabel: UILabel!
    @IBOutlet private weak var rocketNumberLabel: UILabel!
    @IBOutlet private weak var rocketDateLabel: UILabel!
    @IBOutlet private weak var rocketDescTextView: UITextView!
    @IBOutlet private weak var readMoreButton: UIButton!
    
    private let rocketsViewModel = RocketsViewModel()
    private let disposeBag = DisposeBag()
    
    var rocketId: String = ""
    var launchFlightNb: String = ""

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        activateBindings()
    }
}


// MARK: - ViewModel bindings
extension RocketsViewController {
    private func activateBindings() {
        rocketsViewModel.getData(for: rocketId)
        rocketsViewModel.isLoading.bind(to: rx.isLoading).disposed(by: disposeBag)
        rocketsViewModel.didFinishLoadingData.bind { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                printD(error)
            } else {
                self.fillComponents()
            }
        }.disposed(by: disposeBag)
    }
}

extension RocketsViewController {
    
    private func setupComponents() {
        rocketNameLabel.font = Constants.Fonts.Rockets.rocketNameLabelFont
        rocketNumberLabel.font = Constants.Fonts.Rockets.rocketNumberLabelFont
        rocketDateLabel.font = Constants.Fonts.Rockets.rocketDateLabelFont
        rocketDescTextView.font = Constants.Fonts.Rockets.rocketDescTextViewFont
        
        readMoreButton.layer.cornerRadius = 4
        readMoreButton.layer.masksToBounds = true
        containerView.layer.cornerRadius = 25
        containerView.layer.masksToBounds = true
    }
    
    private func fillComponents() {
        let rocket = rocketsViewModel.getItem()
        rocketNameLabel.text = rocket.name
        rocketNumberLabel.text = launchFlightNb
        rocketDateLabel.text = rocket.firstFlight
        rocketDescTextView.text = rocket.description
        if let imageUrl = rocket.flickrImages?.first {
            rocketImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: Constants.Images.placeHolderImage)
        }
    }
    
    @IBAction func readMoreButtonClicked(_ sender: Any) {
        let rocket = rocketsViewModel.getItem()
        if let wikiURL = rocket.wikipedia {
            showWikipediaScreen(with: wikiURL)
        }
    }
    
    @IBAction func shareButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func showWikipediaScreen(with wikiURL: String) {
        let wikipediaViewController = UIStoryboard.viewControllerFromStoryboard(.Inner) as WikipediaViewController
        wikipediaViewController.wikiURL = wikiURL
        present(wikipediaViewController, animated: true, completion: nil)
    }
}
