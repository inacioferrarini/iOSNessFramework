//    The MIT License (MIT)
//
//    Copyright (c) 2017 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import UIKit

///
/// Basic UICollectionViewDelegate abstracting value selection, having elements of type `Type` and using `ConfigurableCollectionViewCell`
///
open class CollectionViewBlockDelegate<CellType: UICollectionViewCell, Type: Equatable>: NSObject, UICollectionViewDelegate
    where CellType: Configurable {


    // MARK: - Properties

    ///
    /// DataSource providing objects.
    ///
    let dataSource: CollectionViewArrayDataSource<CellType, Type>

    ///
    /// When an item is selected, its related model will be supplied.
    ///
    let onSelected: ((Type) -> Void)


    // MARK: - Initialization

    ///
    /// Inits the Delegate.
    ///
    /// - parameter dataSource: DataSource backing the CollectionView, where data will be extracted from.
    ///
    /// - parameter onSelected: Logic to handle value selection.
    ///
    public init(with dataSource: CollectionViewArrayDataSource<CellType, Type>,
                onSelected: @escaping ((Type) -> Void)) {
        self.dataSource = dataSource
        self.onSelected = onSelected
        super.init()
    }


    // MARK: - Row Selection

    ///
    /// CollectionView selection method.
    ///
    /// - parameter collectionView: Where the value was selected.
    ///
    /// - parameter indexPath: The selected item to be related to the selected value.
    ///
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItemObject = self.dataSource.object(at: indexPath) else { return }
        self.onSelected(selectedItemObject)
    }

}
