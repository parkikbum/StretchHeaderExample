import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    var headerView: UIView!
    var images = [#imageLiteral(resourceName: "image1") , #imageLiteral(resourceName: "image1") , #imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image1")]
    var imageViews = [UIImageView]()
    var headerHeigth = UIScreen.main.bounds.height * 0.3
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        setHeader()
        addContentScrollView()
    }

    
    func setHeader(){
        tableView.rowHeight = UITableView.automaticDimension
        
        print(tableView.tableFooterView)
        print(tableView.tableHeaderView)
        headerView = tableView.tableFooterView
        tableView.tableFooterView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: headerHeigth, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeigth)
        updateHeaderView()
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: -headerHeigth, width: tableView.bounds.width, height: headerHeigth)
        if tableView.contentOffset.y < -headerHeigth {
            print("dfaf")
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
            headerHeigth = -tableView.contentOffset.y
            print(headerRect.size.height)

        }
        headerView.frame = headerRect
    }
    
    func addContentScrollView() {
            for i in 1..<images.count + 1 {
                let xPos = self.view.frame.width * CGFloat(i-1)
                let imageView = UIImageView()
                imageView.frame = CGRect(x: xPos, y: 0, width: UIScreen.main.bounds.width, height: headerHeigth)
                imageView.image = images[i-1]
                imageView.tag = i
                scrollView.addSubview(imageView)
                scrollView.contentSize.width = imageView.frame.width * CGFloat(i)
                scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 4, height: headerHeigth)
            }
        }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentHeight = scrollView.contentOffset.y
        print("adfa",currentHeight, headerHeigth)
        headerHeigth = currentHeight

        if currentHeight < -headerHeigth{
               if currentHeight < -headerHeigth{
                updateHeaderView()
                addContentScrollView()
               }
        else{
            print("스트레치 아님 ㅋ")
           }
    }
 
}
}

extension MainVC: UITableViewDelegate {
    
}
extension MainVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xib = UINib(nibName: "MainTVC", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: MainTVC.identifier)
        let cell: MainTVC = tableView.dequeueReusableCell(withIdentifier: MainTVC.identifier) as! MainTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
}
