
final class ___VARIABLE_productName___ViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: Public
    
    var presenter: ___VARIABLE_productName___Presenting!
    
    // MARK: Private

    private let tableView: UITableView
    private let listDisplay: List
    
    // MARK: - Initialisers
    
    init(tableView: UITableView = UITableView(frame: .zero, style: .grouped)) {
        self.tableView = tableView
        listDisplay = List(tableView: tableView)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = UIView()
        view.accessibilityIdentifier = "___VARIABLE_productName___"
        view.backgroundColor = .nabWhite
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        tableView.embed(
            inView: view,
            options: UIView.Embed(layoutGuide: view.safeAreaLayoutGuide, edges: [.top, .bottom])
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
	hideShadowNavigationBar()
        presenter.displayDidLoad()
    }
}

// MARK: - Helpers

private extension ___VARIABLE_productName___ViewController {
    func hideShadowNavigationBar() {
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.standardAppearance.shadowColor = .nabWhite
        } else {
            navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
}

// MARK: - Conformance

// MARK: ___VARIABLE_productName___Displaying

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Displaying {
    func set(sections: [TableViewSectionItem]) {
        listDisplay.set(sections: sections)
    }
}
