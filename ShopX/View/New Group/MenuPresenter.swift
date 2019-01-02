import Foundation

protocol MenuViewDelegate : class {
    func updateView(menu:Menu)
    func showMessage(error:String)
}

class MenuPresenter {
    
    unowned var view:MenuViewDelegate
    
    init(view:MenuViewDelegate) {
        self.view = view
        self.loadData()
    }
    
    public func loadData()  {
        ApiManager.shared.getData { (menu, error) in
            if menu != nil{
                self.view.updateView(menu: menu!)
            }else if error != nil{
                self.view.showMessage(error: error!)
            }else{
                self.view.showMessage(error: "error: occur error in fetch data")
            }
        }
    }
}



