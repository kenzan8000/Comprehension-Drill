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
        let font = UIFont(name: "Helvetica Neue", size: 14.0)
        let offset = CGFloat(14.0)
        let labelHeight = UILabel.cpd_size(text: paragraph, font: font!, width: UIScreen.mainScreen().bounds.width).height
        return (labelHeight + offset * 2)
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
        self.paragraphLabel.preferredMaxLayoutWidth = self.paragraphLabel.frame.width
        self.paragraphLabel.sizeToFit()
/*
        self.frame = CGRectMake(
            self.frame.origin.x,
            self.frame.origin.y,
            self.frame.width,
            self.paragraphLabel.frame.origin.y + self.paragraphLabel.frame.height
        )
*/
/*
        self.paragraphLabel.frame = CGRectMake(
            self.paragraphLabel.frame.origin.x,
            self.paragraphLabel.frame.origin.y - self.frame.height / 2,
            self.paragraphLabel.frame.width,
            self.paragraphLabel.frame.height
        )
        CPDLOG(self.frame)
*/
    }

}
