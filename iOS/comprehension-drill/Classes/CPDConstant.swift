/// MARK: - functions

/**
 * display log
 * @param body log
 */
func CPDLOG(str: String) {
#if DEBUG
    print("////////// CPD log\n" + str + "\n\n")
#endif
}

/**
 * return class name
 * @param classType classType
 * @return class name
 */
func CPDNSStringFromClass(classType:AnyClass) -> String {
    let classString = NSStringFromClass(classType.self)
    let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
    return classString.substringFromIndex(range!.endIndex)
}


/// MARK: - Notification


/// MARK: - API

/// Base URI
#if LOCAL_SERVER
let kURIBase =                          "http://localhost:3000"
#elseif DEV_SERVER
let kURIBase =                          "http://localhost:3000"
#else
let kURIBase =                          "http://localhost:3000"
#endif


/// MARK: - Article

let kURIArticleAPI =                    kURIBase + "/article"

struct CPDArticle {
    struct API {
        static let GetArticle =         kURIArticleAPI
    }
}
