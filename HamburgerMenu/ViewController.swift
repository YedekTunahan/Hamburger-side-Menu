

import UIKit
import SideMenu

class ViewController: UIViewController,MenuControllerDelegate, UINavigationControllerDelegate {

    private var sideMenu:SideMenuNavigationController?
    
    private let  settingsController = SettingsViewController()
    private let  outController = OutViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let menu = MenuController(with:sideMenuItem.allCases)
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view) 
        
        addChildControllers()
    }
    private func addChildControllers(){
        addChild(settingsController)
        addChild(outController)
        view.addSubview(settingsController.view)
        view.addSubview(outController.view)
        settingsController.view.frame = view.bounds
        outController.view.frame = view.bounds
        
        settingsController.didMove(toParent: self)
        outController.didMove(toParent: self)
        
        settingsController.view.isHidden = true
        outController.view.isHidden = true
    }
    
    @IBAction func didTapMenuBtnClick(_ sender: Any) {
        present(sideMenu!,animated: true)
    }
    
    func didSelectMenuItem(name: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            //MARK: Segue işlemleri
            
           
            self?.title = name
            
            /*
            if name == "home"{
                self?.settingsController.view.isHidden = true
                self?.outController.view.isHidden = true
            }else if name == "settings"{
                self?.settingsController.view.isHidden = false
                self?.outController.view.isHidden = true
            }else if name == "out"{
                self?.settingsController.view.isHidden = true
                self?.outController.view.isHidden = false
            }
             */
        })
    }
    
}







