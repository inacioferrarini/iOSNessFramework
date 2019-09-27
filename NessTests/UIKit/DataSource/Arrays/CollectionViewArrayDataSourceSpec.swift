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
import Quick
import Nimble
@testable import Ness

class CollectionViewArrayDataSourceSpec: QuickSpec {

    override func spec() {

        describe("Collection View Array Data Source") {

            describe("Initialization") {

                it("convenience init must set default block ") {
                    // Given
                    let items = [10]
                    let collectionView = TestCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
                    let dataProvider = ArrayDataProvider<Int>(section: items)
                    let dataSource = CollectionViewArrayDataSource<NumberCollectionViewCell, Int>(for: collectionView, with: dataProvider)

                    // When
                    let indexPath = IndexPath(row: 0, section: 0)
                    let className = dataSource.reuseIdentifier(indexPath)

                    // Then
                    expect(dataSource.dataProvider).toNot(beNil())
                    expect(dataSource.dataProvider.numberOfSections()).to(equal(1))
                    expect(dataSource.dataProvider.numberOfItems(in: 0)).to(equal(1))
                    expect(dataSource.reuseIdentifier).toNot(beNil())
                    expect(className).to(equal("NumberCollectionViewCell"))
                }

                it("regular init must set given values") {
                    // Given
                    let items = [10]
                    let collectionView = TestCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
                    let reuseIdentifier = { (indexPath: IndexPath) -> String in
                        return ""
                    }
                    let dataProvider = ArrayDataProvider<Int>(section: items)
                    let dataSource = CollectionViewArrayDataSource<NumberCollectionViewCell, Int>(for: collectionView,
                                                                                                  reuseIdentifier: reuseIdentifier,
                                                                                                  with: dataProvider)

                    // When
                    let indexPath = IndexPath(row: 0, section: 0)
                    let className = dataSource.reuseIdentifier(indexPath)

                    // Then
                    expect(dataSource.dataProvider).toNot(beNil())
                    expect(dataSource.dataProvider.numberOfSections()).to(equal(1))
                    expect(dataSource.dataProvider.numberOfItems(in: 0)).to(equal(1))
                    expect(dataSource.reuseIdentifier).toNot(beNil())
                    expect(className).to(equal(""))
                }

            }

        }

        describe("refresh") {

            it("must refresh collectionView") {
                // Given
                var blockWasCalled = false
                let items = [10]
                let collectionView = TestCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
                collectionView.register(NumberCollectionViewCell.self, forCellWithReuseIdentifier: "NumberCollectionViewCell")
                collectionView.onReloadData = {
                    blockWasCalled = true
                }
                let dataProvider = ArrayDataProvider<Int>(section: items)
                let dataSource = CollectionViewArrayDataSource<NumberCollectionViewCell, Int>(for: collectionView, with: dataProvider)
                collectionView.dataSource = dataSource

                // When
                dataSource.refresh()

                // Then
                expect(blockWasCalled).to(beTruthy())
            }

        }

        it("numberOfItemsInSection must return 3") {
            // Given
            let items = [10, 20, 30]
            let collectionView = TestCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
            let dataProvider = ArrayDataProvider<Int>(section: items)
            let dataSource = CollectionViewArrayDataSource<NumberCollectionViewCell, Int>(for: collectionView, with: dataProvider)

            // When
            let rows = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)

            // Then
            expect(rows).to(equal(3))
        }

        describe("cellForItemAt") {

            it("must setup cell and return it") {
                // Given
                var blockWasCalled = false
                let items = [10]
                let collectionView = TestCollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
                collectionView.register(NumberCollectionViewCell.self, forCellWithReuseIdentifier: "NumberCollectionViewCell")
                let dataProvider = ArrayDataProvider<Int>(section: items)
                let dataSource = CollectionViewArrayDataSource<NumberCollectionViewCell, Int>(
                    for: collectionView,
                    with: dataProvider)
                collectionView.dataSource = dataSource

                let indexPath = IndexPath(row: 0, section: 0)


                let numberCell = NumberCollectionViewCell()
                numberCell.setup = { (value) -> Void in
                    blockWasCalled = true
                }
                collectionView.onDequeueReusableCell = { (reuseIdentifier, indexPath) -> UICollectionViewCell in
                     return numberCell
                }

                // When
                let cell = dataSource.collectionView(collectionView, cellForItemAt: indexPath)

                // Then
                expect(cell).toNot(beNil())
                expect(blockWasCalled).to(beTruthy())
            }

        }

    }

}
