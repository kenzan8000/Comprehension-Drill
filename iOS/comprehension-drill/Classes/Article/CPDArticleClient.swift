/// MARK: - CPDArticleClient
class CPDArticleClient {

    /// MARK: - class method
    static let sharedInstance = CPDArticleClient()


    /// MARK: - public api

    /**
     * request CPDArticle.API.GetArticle
     * @param offset article's offset
     * @param count article's count you want to get
     * @param language article's language
     * @param completionHandler (json: JSON) -> Void
     */
    func getArticle(
        offset offset: Int,
        count: Int,
        language: String,
        completionHandler: (json: JSON) -> Void
    ) {

        // API URL
        let url = NSURL(
            URLString: CPDArticle.API.GetArticle,
            queries: [
                "offset" : "\(offset)",
                "count" : "\(count)",
                "language" : language
            ]
        )

        // request
        let request = NSURLRequest(URL: url!)
        let operation = ISHTTPOperation(
            request: request,
            handler:{ (response: NSHTTPURLResponse!, object: AnyObject!, error: NSError!) -> Void in
                var responseJSON = JSON([:])
                if object != nil { responseJSON = JSON(data: object as! NSData) }
                dispatch_async(dispatch_get_main_queue(), { completionHandler(json: responseJSON) })
            }
        )
        CPDArticleOperationQueue.defaultQueue().addOperation(operation)
    }

    /**
     * cancel get article API
     **/
    func cancelGetArticle() {
        CPDArticleOperationQueue.defaultQueue().cancelOperationsWithPath(NSURL(string: CPDArticle.API.GetArticle)!.path)
    }

}

