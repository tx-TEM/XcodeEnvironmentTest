import Foundation

final class RootViewModel {}

extension RootViewModel {
    func numberOfRowsInSection(section: Int) -> Int {
        return sections.count
    }
}

extension RootViewModel {
    typealias Section = RootViewModelSection

    enum RootViewModelSection: CaseIterable {
        case item
    }

    var sections: [Section] {
        return Section.allCases
    }
}
