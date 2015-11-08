import UIKit


/// MARK: - CPDArticleTableViewCell
class CPDArticleTableViewCell: UITableViewCell {

    /// MARK: - property

    @IBOutlet weak var titleLabel: UILabel!


    /// MARK: - class method

    /**
     * return cell height
     * @return CGFloat
     **/
    class func cpd_height() -> CGFloat {
        return 64.0
    }

    /**
     * get cell
     * @return CPDArticleTableViewCell
     **/
    class func cpd_cell() -> CPDArticleTableViewCell {
        return UINib(nibName: CPDNSStringFromClass(CPDArticleTableViewCell), bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! CPDArticleTableViewCell
    }


    /// MARK: - life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    /// MARK: - event listener

}
