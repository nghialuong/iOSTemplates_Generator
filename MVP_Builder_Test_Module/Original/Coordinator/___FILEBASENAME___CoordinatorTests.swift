import XCTest

final class ___VARIABLE_productName___CoordinatorTests: XCTestCase {
    
    // MARK: - Properties
    
    private var coordinator: ___VARIABLE_productName___Coordinator!
    private var mockCoordinator: MockCoordinating!
    private var mockRouter: MockRouting!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        configure()
    }
    
    override func tearDown() {
        coordinator = nil
        mockCoordinator = nil
        mockRouter = nil
        super.tearDown()
    }
    
    // MARK: - Tests
}

// MARK: - Helpers

private extension ___VARIABLE_productName___CoordinatorTests {

    private func configure(
        parentCoordinator: MockCoordinating = MockCoordinating(),
        router: MockRouting = MockRouting()
    ) {
        mockCoordinator = parentCoordinator
        mockRouter = router
        coordinator = ___VARIABLE_productName___Coordinator(
            parentCoordinator: mockCoordinator,
            router: mockRouter
        )
    }
}
