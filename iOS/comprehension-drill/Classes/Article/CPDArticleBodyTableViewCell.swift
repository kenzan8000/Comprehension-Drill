import UIKit


/// MARK: - CPDArticleBodyTableViewCell
class CPDArticleBodyTableViewCell: UITableViewCell {

    /// MARK: - property

    @IBOutlet weak var paragraphLabel: UILabel!


    /// MARK: - class method

    /**
     * return cell height
     * @param paragraph String
     * @return CGFloat
     **/
    class func cpd_height(paragraph paragraph: String) -> CGFloat {
        return 64.0
    }

    /**
     * get cell
     * @return CPDArticleBodyTableViewCell
     **/
    class func cpd_cell() -> CPDArticleBodyTableViewCell {
        return UINib(nibName: CPDNSStringFromClass(CPDArticleBodyTableViewCell), bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! CPDArticleBodyTableViewCell
    }


    /// MARK: - life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    /// MARK: - event listener


    /// MARK: - public api

    /**
     * design
     * @param paragraph String
     * @param isSelected Bool
     **/
    func design(paragraph paragraph: String, isSelected: Bool) {
        self.paragraphLabel.text = paragraph
    }

}
