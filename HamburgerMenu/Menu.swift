
import Foundation
import UIKit
protocol MenuControllerDelegate {
    func didSelectMenuItem(name:sideMenuItem)
}
class MenuController : UITableViewController {
   
    public var delegate: MenuControllerDelegate?
    
   private let menuItems: [sideMenuItem]
    
    enum sideMenuItem:String,CaseIterable{
        case home = "home"
        case settings = "settings"
        case out = "out"
    }
    
   init(with menuItems: [sideMenuItem]){
       self.menuItems = menuItems
       super.init(nibName: nil, bundle: nil)
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "hmbrgCell")
   }
   
   override func viewDidLoad() {
       super.viewDidLoad()
       tableView.backgroundColor = .black
       view.backgroundColor = .black
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "hmbrgCell", for: indexPath)
       cell.textLabel?.text = menuItems[indexPath.row].rawValue
       cell.textLabel?.textColor = .white
       cell.backgroundColor = .black
       cell.contentView.backgroundColor = .black
       return cell
   }
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true) /// ???
       
       let selectedItem = menuItems[indexPath.row]
       delegate?.didSelectMenuItem(name: selectedItem)
       
   }
}



