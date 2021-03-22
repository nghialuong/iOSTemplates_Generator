
final class ___VARIABLE_productName___Coordinator: NSObject, Coordinating {
    
    // MARK: - Properties
    
    // MARK: Public
    
    weak var parentCoordinator: Coordinating?
    var childCoordinators: [Coordinating] = []
    
    // MARK: Private
    
    private let router: Routing

    // MARK: - Initialisers
    
    init(parentCoordinator: Coordinating?, router: Routing) {
        self.parentCoordinator = parentCoordinator
        self.router = router
    }
    
    // MARK: - Public functions
    
	func start() {
        let viewController: ___VARIABLE_productName___ViewController = ___VARIABLE_productName___ViewController()
        
        viewController.presenter = ___VARIABLE_productName___Presenter(
            display: viewController,
            coordinatorDelegate: self
        )
        
        let navigationViewController = ModalNavigationController(rootViewController: viewController)
        router.present(viewController: navigationViewController)
    }
}

// MARK: - Conformance

// MARK: ___VARIABLE_productName___CoordinatorPresentingDelegate

extension ___VARIABLE_productName___Coordinator: ___VARIABLE_productName___CoordinatorPresentingDelegate {
	func ___VARIABLE_productName___DidDismissed() {
        router.dismissViewController()
        coordinatorDidFinish()
	}
}

