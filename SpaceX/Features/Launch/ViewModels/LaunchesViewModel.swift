//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation
import RxSwift
import RxCocoa

class LaunchesViewModel {
    
    let isLoading: BehaviorRelay<Bool> = .init(value: false)
    let didFinishLoadingData: PublishRelay<Error?> = .init()
    private let apiClient: GetLaunchesAPIClient = APIClient()
    private var items = [LaunchModelDTO]()
    
    func getData() {
        isLoading.accept(true)
        apiClient.fetchLaunches { [weak self] response in
            guard let self = self else { return }
            self.isLoading.accept(false)
            self.setupData(data: response)
            self.didFinishLoadingData.accept(nil)
        } failure: { error in
            self.didFinishLoadingData.accept(error)
        }
    }
    
    private func setupData(data: [LaunchModel]) {
        items.removeAll()
        for dataItem in data {
            if prepareViewModelItem(data: dataItem).shouldBePresented {
                items.append(prepareViewModelItem(data: dataItem))
            }
        }
    }
    
    func numberOfRows() -> Int {
        items.count
    }
    
    func item(atIndex index: Int) -> LaunchModelDTO {
        items[index]
    }
}


// MARK: - Helpers
extension LaunchesViewModel {
    private func prepareViewModelItem(data: LaunchModel) -> LaunchModelDTO {
        return LaunchModelDTO(
            links: data.links,
            rocket: data.rocket,
            details: data.details,
            flightNumber: data.flightNumber,
            dateUTC: data.dateUTC,
            dateUnix: data.dateUnix,
            autoUpdate: data.autoUpdate,
            id: data.id,
            upcoming: data.upcoming,
            success: data.success
        )
    }
}
