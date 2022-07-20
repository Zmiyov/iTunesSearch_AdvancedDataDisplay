//
//  ItemDisplaying.swift
//  iTunesSearch
//
//  Created by Vladimir Pisarenko on 11.07.2022.
//

import UIKit

protocol ItemDisplaying {
    var itemImageView: UIImageView! { get set }
    var titleLabel: UILabel! { get set }
    var detailLabel: UILabel! { get set }
}

@MainActor
extension ItemDisplaying {
    func configure(for item: StoreItem, storeItemcontroller: StoreItemController) async {
        titleLabel.text = item.name
        detailLabel.text = item.artist
        itemImageView.image = UIImage(systemName: "photo")
        
        do {
            let image = try await storeItemcontroller.fetchImage(from: item.artworkURL)
            self.itemImageView.image = image
        } catch let error as NSError where error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
            // ignore cancellation errors
        } catch {
            self.itemImageView.image = UIImage(systemName: "photo")
            print("Error fetching image: \(error)")
        }
    }
}
