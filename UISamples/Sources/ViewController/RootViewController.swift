import UIKit

class RootViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    static var compositionalLayoutCollectionViewController: UIViewController? {
        let storyboard = UIStoryboard(name: "CompositionalLayoutCollection", bundle: nil)
        return storyboard.instantiateInitialViewController()
    }

    let destinations: [Destination] = [
        Destination(name: "\(CompositionalLayoutCollectionViewController.self)", vc: RootViewController.compositionalLayoutCollectionViewController)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate =  self
        tableView.dataSource = self
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = destinations[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = destinations[indexPath.row].vc else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RootViewController {
    struct Destination {
        var name: String
        var vc: UIViewController?
    }
}
