//
//  StoreItemTableViewDiffableDataSource.swift
//  iTunesSearch
//
//  Created by Vladimir Pisarenko on 21.07.2022.
//

import UIKit

@MainActor
class StoreItemTableViewDiffableDataSource: UITableViewDiffableDataSource<String, StoreItem> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section]
    }
}
