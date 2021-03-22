import XCTest

final class ___VARIABLE_productName___PresenterTests: XCTestCase {

    // MARK: - Properties
    
    private var presenter: ___VARIABLE_productName___Presenter!
    private var mockCoordinatorDelegate: Mock___VARIABLE_productName___CoordinatorPresentingDelegate!
    private var mockDisplay: Mock___VARIABLE_productName___Display!
    private var mockBuilder: Mock___VARIABLE_productName___Builder!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        configure()
    }
    
    override func tearDown() {
        presenter = nil
        mockCoordinatorDelegate = nil
        mockDisplay = nil
        mockBuilder = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
}

// MARK: - Helpers

private extension ___VARIABLE_productName___PresenterTests {

    func configure(
        coordinatorDelegate: Mock___VARIABLE_productName___CoordinatorPresentingDelegate = Mock___VARIABLE_productName___CoordinatorPresentingDelegate(),
        display: Mock___VARIABLE_productName___Display = Mock___VARIABLE_productName___Display(),
        builder: Mock___VARIABLE_productName___Builder = Mock___VARIABLE_productName___Builder()
    ) {
        mockCoordinatorDelegate = coordinatorDelegate
        mockDisplay = display
        mockBuilder = builder
        
        presenter = ___VARIABLE_productName___Presenter(
            display: mockDisplay,
            coordinatorDelegate: mockCoordinatorDelegate,
            builder: { [unowned builder] in builder }
        )
    }
}

private final class Mock___VARIABLE_productName___CoordinatorPresentingDelegate: ___VARIABLE_productName___CoordinatorPresentingDelegate {
}

private final class Mock___VARIABLE_productName___Display: MockDisplay, ___VARIABLE_productName___Displaying {
    
    private(set) var sections: [TableViewSectionItem]?
    private(set) var setSectionsCalledCount: Int = 0
    func set(sections: [TableViewSectionItem]) {
        setSectionsCalledCount += 1
        self.sections = sections
    }
}

private final class Mock___VARIABLE_productName___Builder: ___VARIABLE_productName___Building {
    private var orderCount = 0
    private var incrementOrderCount: Int {
        orderCount += 1
        return orderCount
    }

    private(set) var buildOrder = 0
    var stubSections: [TableViewSectionItem] = []
    func build() -> [TableViewSectionItem] {
        buildOrder = incrementOrderCount
        return stubSections
    }
}
