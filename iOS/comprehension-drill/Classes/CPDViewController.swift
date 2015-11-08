import UIKit


class CPDViewController: UIViewController {

    /// MARK: - property
    @IBOutlet weak var tableView: UITableView!
    var articles: [CPDArticle] = []


    /// MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.articles = CPDArticle.fetch(language: "en-us")
        self.tableView.reloadData()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = self.tableView.indexPathForSelectedRow
        if indexPath != nil { self.tableView.deselectRowAtIndexPath(indexPath!, animated: true) }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == CPDNSStringFromClass(CPDArticleViewController)) {
            let articleViewController = segue.destinationViewController as! CPDArticleViewController
            articleViewController.article = sender as! CPDArticle
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    /// MARK: - event listener

    /**
     * update article
     * @param barbuttonItem UIBarButtonItem
     **/
    @IBAction func touchUpInside(barbuttonItem barbuttonItem: UIBarButtonItem) {
        self.updateArticle()
    }


    /// MARK: - private api

    /**
     * update article
     **/
    private func updateArticle() {
        CPDArticle.request({ (json) in
                CPDLOG(json)
                CPDArticle.save(json: json)
                self.articles = CPDArticle.fetch(language: "en-us")
                self.tableView.reloadData()
            }
        )
    }

}


/// MARK: - UITableViewDelegate, UITableViewDataSource
extension CPDViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let article = self.articles[indexPath.row]

        let cell = CPDArticleTableViewCell.cpd_cell()
        cell.titleLabel.text = article.title

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let article = self.articles[indexPath.row]
        self.performSegueWithIdentifier(CPDNSStringFromClass(CPDArticleViewController), sender: article)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CPDArticleTableViewCell.cpd_height()
    }

}

