
protocol ___VARIABLE_productName___CoordinatorPresentingDelegate: AnyObject {}

protocol ___VARIABLE_productName___Displaying: Display {
    func set(sections: [TableViewSectionItem])
}

protocol ___VARIABLE_productName___Presenting {
    func displayDidLoad()
}

final class ___VARIABLE_productName___Presenter {

    // MARK: - Properties
    
    private weak var display: ___VARIABLE_productName___Displaying!
    private weak var coordinatorDelegate: ___VARIABLE_productName___CoordinatorPresentingDelegate!
    private let builder: () -> ___VARIABLE_productName___Building
    
    // MARK: - Initialisers
    
    init(
        display: ___VARIABLE_productName___Displaying,
        coordinatorDelegate: ___VARIABLE_productName___CoordinatorPresentingDelegate,
        builder: @escaping () -> ___VARIABLE_productName___Building = { ___VARIABLE_productName___Builder() }
    ) {
        self.display = display
        self.coordinatorDelegate = coordinatorDelegate
        self.builder = builder
    }
}

// MARK: - Conformance

// MARK: ___VARIABLE_productName___Presenting

extension ___VARIABLE_productName___Presenter: ___VARIABLE_productName___Presenting {
    func displayDidLoad() {
        display.set(title: MessageCode.title.text)
        
        buildContent()
    }
}

// MARK: - Helpers

extension ___VARIABLE_productName___Presenter {
    
    private func buildContent() {
        let sections = builder()
            .build()
        
        display.set(sections: sections)
    }
}

// MARK: - Constants

private extension ___VARIABLE_productName___Presenter {
    enum MessageCode: String, Localizable {
        case title = "___VARIABLE_productName___"
    }
}

// MARK: - Actions

private extension ___VARIABLE_productName___Presenter {
    
    //TODO: - remove example below
    
    var closeAction: ButtonAction {
        return {
        }
    }
}
