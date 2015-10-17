import CoreData


/// MARK: - CPDArticle
class CPDArticle: NSManagedObject {

    /// MARK: - property
    @NSManaged var web_site_id: NSNumber
    @NSManaged var pub_date: NSDate
    @NSManaged var title: String
    @NSManaged var question: String
    @NSManaged var link: String
    @NSManaged var language: String
    @NSManaged var body: String


    /// MARK: - class method

    /**
     * fetch datas from coredata
     * @param offset article's offset
     * @param count article's count you want to get
     * @param language article's language
     * @return [CPDArticle]
     */
    func fetch(offset offset: Int, count: Int, language: String) -> [CPDArticle] {
        let context = CPDCoreDataManager.sharedInstance.managedObjectContext

        // make fetch request
        let fetchRequest = NSFetchRequest()
        let entity = NSEntityDescription.entityForName("CPDArticle", inManagedObjectContext:context)
        fetchRequest.entity = entity
        fetchRequest.fetchBatchSize = 20
        let predicaets = [
            NSPredicate(format: "(timestamp >= %@) AND (timestamp < %@)", offset, count),
        ]
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicaets)
        fetchRequest.returnsObjectsAsFaults = false

        // return articles
        var articles: [CPDArticle]? = []
        do { articles = try context.executeFetchRequest(fetchRequest) as? [CPDArticle] }
        catch { articles = [] }
        return articles!
    }

    /**
     * save json datas to coredata
     * @param json JSON
     * {
     *   "application_code" : 200,
     *   "articles" : [
     *     {
     *       "web_site_id" : 1,
     *       "pub_date" : "2015-09-29T00:30:00.000Z",
     *       "id" : 2,
     *       "created_at" : "2015-10-03T14:28:12.147Z",
     *       "title" : "Brad Pitt movie scares farm animals",
     *       "question" : "What was Brad Pitt's role in the movie?\n\n...",
     *       "link" : "http:\/\/www.breakingnewsenglish.com\/1509\/150929-the-lost-city-of-z.html",
     *       "language" : "en-us",
     *       "updated_at" : "2015-10-03T14:28:12.147Z",
     *       "body" : "A movie produced ..."
     *     },
     *     ...
     *    ]
     * }
     *
     */
    class func save(json json: JSON) {
        if json["application_code"] != 200 { return } // fail

        let articleJSONs = json["articles"].arrayValue
        let context = CPDCoreDataManager.sharedInstance.managedObjectContext

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        for articleJSON in articleJSONs {
            let pub_date = dateFormatter.dateFromString(articleJSON["pub_date"].stringValue)
            if pub_date == nil { continue }

            let article = NSEntityDescription.insertNewObjectForEntityForName("CPDArticle", inManagedObjectContext: context) as! CPDArticle
            article.web_site_id = articleJSON["web_site_id"].numberValue
            article.pub_date = pub_date!
            article.title = articleJSON["title"].stringValue
            article.question = articleJSON["question"].stringValue
            article.link = articleJSON["link"].stringValue
            article.language = articleJSON["language"].stringValue
            article.body = articleJSON["body"].stringValue
        }

        do { try context.save() }
        catch { return }
    }

}
