//
//  RockectsViewModel.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation
import RxSwift
import RxCocoa

class RocketsViewModel {
    
    let isLoading: BehaviorRelay<Bool> = .init(value: false)
    let didFinishLoadingData: PublishRelay<Error?> = .init()
    private let apiClient: GetRocketsAPIClient = APIClient()
    private var item = RocketModelDTO(flickrImages: nil, name: nil, firstFlight: nil, wikipedia: nil, description: nil, id: nil)
    
    func getData(for rocketId: String) {
        apiClient.fetchRockets(rocketId: rocketId) { [weak self] response in
            guard let self = self else { return }
            self.isLoading.accept(false)
            self.setupData(data: response)
            self.didFinishLoadingData.accept(nil)
        } failure: { error in
            self.didFinishLoadingData.accept(error)
        }
    }
    
    private func setupData(data: RocketModel) {
        item = prepareViewModelItem(data: data)
    }
    
    func getItem() -> RocketModelDTO {
        item
    }
}


// MARK: - Helpers
extension RocketsViewModel {
    private func prepareViewModelItem(data: RocketModel) -> RocketModelDTO {
        return RocketModelDTO(
            flickrImages: data.flickrImages,
            name: data.name,
            firstFlight: data.firstFlight,
            wikipedia: data.wikipedia,
            description: data.description,
            id: data.id
        )
    }
}
