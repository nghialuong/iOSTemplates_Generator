
protocol ___VARIABLE_productName___Building {
    
    func build() -> [TableViewSectionItem]
}

final class ___VARIABLE_productName___Builder {
    
    // MARK: - Builder Output
    
    private var sections: [TableViewSectionItem] = []
}

// MARK: - Conformance

// MARK: ___VARIABLE_productName___Building

extension ___VARIABLE_productName___Builder: ___VARIABLE_productName___Building {
    
    func build() -> [TableViewSectionItem] {
        return sections
    }
}
