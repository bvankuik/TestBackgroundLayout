import UIKit

class ViewController: UIViewController {
    
    private var containerView: UIView!
    private var fillerView: UIView!
    private var tableViewController: TableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ViewController"
//        self.addBackground()

        // Set up container for the tableview
        self.containerView = UIView()
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.containerView)
        
        let viewDict = ["container": self.containerView]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[container(350)]", options: [], metrics: nil, views: viewDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[container]|", options: [], metrics: nil, views: viewDict))

        // Add tableview controller as child
        tableViewController = TableViewController()
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(tableViewController)
        self.containerView.addSubview(tableViewController.view)
        tableViewController.didMoveToParentViewController(self)

        // Layout
        let tableViewDict = ["child": tableViewController.view]
        self.containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[child]|", options: [], metrics: nil, views: tableViewDict))
        self.containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[child]|", options: [], metrics: nil, views: tableViewDict))
    }

    private func addBackground() {
        let backgroundImage = UIImage(named: "hexley_fork_450")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(backgroundImageView)
        
        let viewDict = ["backgroundImageView": backgroundImageView]
        let layouts = [
            "H:[backgroundImageView]|",
            "V:[backgroundImageView]|",
        ]
        
        for layout in layouts {
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(layout, options: [], metrics: nil, views: viewDict))
        }
    }
    
}

