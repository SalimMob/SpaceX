//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import UIKit
import RxSwift
import RxCocoa

class LaunchesViewController: UIViewController {

    // MARK: Instance variables
    private let launchesViewModel = LaunchesViewModel()
    
    @IBOutlet private weak var launchesCollectionView: UICollectionView!
    private let nibFileName = "LaunchCollectionViewCell"
    private let reusableIdentifier = "LaunchCollectionViewCell"
    private let cellWidth: CGFloat = 191.0
    private let cellHeight: CGFloat = 200.0
    private let cellSeparatorHorizontal = CGFloat(15.0)
    
    @IBOutlet private weak var bigLaunchImage: UIImageView!
    @IBOutlet private weak var profileView: UIView!
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var goldButton: UIButton!
    @IBOutlet private weak var spaceButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        addBarButtonItems()
        setupComponents()
        activateBindings()
    }
}


// MARK: - ViewModel bindings
extension LaunchesViewController {
    private func activateBindings() {
        launchesViewModel.getData()
        launchesViewModel.isLoading.bind(to: rx.isLoading).disposed(by: disposeBag)
        launchesViewModel.didFinishLoadingData.bind { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                print(error)
            } else {
                self.reloadCollectionView()
            }
        }.disposed(by: disposeBag)
    }
}


// MARK: - Collection View Delegate & Data Source
extension LaunchesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        launchesViewModel.numberOfRows()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as? LaunchCollectionViewCell {
            let item = launchesViewModel.item(atIndex: indexPath.row)
            cell.setupContent(model: item)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = launchesViewModel.item(atIndex: indexPath.row)
        if let rocketId = item.rocket, let launchFlightNb = (item.flightNumber)?.stringValue {
            showRocketsScreen(rocketId: rocketId, launchFlightNb: launchFlightNb)
        }
    }
}

// MARK: - Setup UI
extension LaunchesViewController {
    private func setupCollectionView() {
        launchesCollectionView.register(UINib(nibName: nibFileName, bundle: nil), forCellWithReuseIdentifier: reusableIdentifier)
        launchesCollectionView.delegate = self
        launchesCollectionView.dataSource = self
        launchesCollectionView.isPagingEnabled = false
        launchesCollectionView.alwaysBounceVertical = false
        launchesCollectionView.showsHorizontalScrollIndicator = false
        launchesCollectionView.backgroundColor = .clear
        launchesCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = cellSeparatorHorizontal
        layout.minimumLineSpacing = cellSeparatorHorizontal
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        launchesCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func reloadCollectionView() {
        DispatchQueue.main.async {
            self.launchesCollectionView.reloadData()
        }
    }
    
    private func setupComponents() {
        setLeftAlignTitleView(font: Constants.Fonts.Launches.navigationBarTitleFont, text: "Launches", textColor: .black, leftSpacing: 25)
        bigLaunchImage.layer.cornerRadius = 10.0
        bigLaunchImage.layer.masksToBounds = true
        profileView.layer.cornerRadius = profileView.frame.width / 2
        profileView.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        goldButton.layer.cornerRadius = 10
        goldButton.layer.masksToBounds = true
    }
    
    func addBarButtonItems() {
        let notifImage   = Constants.Images.notifButtonIcon?.withRenderingMode(.alwaysOriginal)
        let searchImage  = Constants.Images.searchButtonIcon?.withRenderingMode(.alwaysOriginal)
        // Add Notification
        let notifView = UIView()
        notifView.backgroundColor = .clear
        notifView.translatesAutoresizingMaskIntoConstraints = false
        
        let notifButtonView = UIButton()
        notifButtonView.setImage(notifImage, for: .normal)
        notifButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        let notifLabel = UILabel()
        notifLabel.backgroundColor = .red
        notifLabel.translatesAutoresizingMaskIntoConstraints = false
        notifLabel.text = "2"
        notifLabel.textAlignment = .center
        notifLabel.textColor = .white
        notifLabel.font = Constants.Fonts.Launches.indicatorLabelFont
        notifLabel.backgroundColor = UIColor(red: 203/255, green: 155/255, blue: 3/255, alpha: 1.0)
        notifLabel.layer.cornerRadius = 10
        notifLabel.layer.masksToBounds = true
        
        notifView.addSubview(notifButtonView)
        notifView.addSubview(notifLabel)
        
        NSLayoutConstraint.activate([
            notifButtonView.topAnchor.constraint(equalTo: notifView.topAnchor, constant: 0),
            notifButtonView.leadingAnchor.constraint(equalTo: notifView.leadingAnchor, constant: 0),
            notifButtonView.bottomAnchor.constraint(equalTo: notifView.bottomAnchor, constant: 0),
            notifButtonView.trailingAnchor.constraint(equalTo: notifView.trailingAnchor, constant: -20),
            
            notifLabel.topAnchor.constraint(equalTo: notifButtonView.topAnchor, constant: -10),
            notifLabel.leadingAnchor.constraint(equalTo: notifButtonView.trailingAnchor, constant: -10),
            notifLabel.widthAnchor.constraint(equalToConstant: 20),
            notifLabel.heightAnchor.constraint(equalTo: notifLabel.widthAnchor),
        ])
        
        let notifButton = UIBarButtonItem(customView:notifView)
        notifButtonView.rx.tap.bind { [weak self] in
            guard let self = self else { return }
            self.didTapNotifButton()
        }.disposed(by: disposeBag)
        
        // Add search
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: nil)
        searchButton.rx.tap.bind { [weak self] in
            guard let self = self else { return }
            self.didTapSearchButton()
        }.disposed(by: disposeBag)
        //
        navigationItem.rightBarButtonItems = [notifButton, searchButton]
    }
    
    private func didTapNotifButton() {
        print("Notification clicked...")
    }
    
    private func didTapSearchButton() {
        print("Search clicked...")
    }
    
    private func showRocketsScreen(rocketId: String, launchFlightNb: String) {
        let rocketsViewController = UIStoryboard.viewControllerFromStoryboard(.Inner) as RocketsViewController
        rocketsViewController.rocketId = rocketId
        rocketsViewController.launchFlightNb = launchFlightNb
        rocketsViewController.modalPresentationStyle = .overFullScreen
        self.present(rocketsViewController, animated: true, completion: nil)
    }
}


extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach({ addSubview($0) })
    }
}
