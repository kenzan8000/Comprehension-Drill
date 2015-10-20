import UIKit


/// MARK: - CPDArticleTableViewCell
class CPDArticleTableViewCell: UITableViewCell {

    /// MARK: - property

    @IBOutlet weak private var titleLabel: UILabel!


    /// MARK: - class method

    class func cpd_height() -> CGFloat {
        return 54.0
    }


    /// MARK: - life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    /// MARK: - event listener

}
