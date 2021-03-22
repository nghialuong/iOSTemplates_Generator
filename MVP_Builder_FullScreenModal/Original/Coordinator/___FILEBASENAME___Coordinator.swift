
final class ___VARIABLE_productName___Coordinator: NSObject, Coordinating {
    
    // MARK: - Properties
    
    // MARK: Public
    
    weak var parentCoordinator: Coordinating?
    var childCoordinators: [Coordinating] = []
    
    // MARK: Private
    
    private let router: Routing
    private var completion: Block?
    
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
        
        router.push(viewController: viewController) { [weak self] in
            self?.coordinatorDidFinish()
        }
    }
}

// MARK: - Conformance

// MARK: ___VARIABLE_productName___CoordinatorPresentingDelegate

extension ___VARIABLE_productName___Coordinator: ___VARIABLE_productName___CoordinatorPresentingDelegate {
}

