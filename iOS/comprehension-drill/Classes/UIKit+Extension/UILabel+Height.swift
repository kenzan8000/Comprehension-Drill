import UIKit


/// MARK: - UILabel+Height
extension UILabel {

    /// MARK: - class method

    /**
     * get estimated size
     * @param text String
     * @param font UIFont
     * @param width CGFloat
     * @return CGSize
     */
    class func cpd_size(text text: String, font: UIFont, width: CGFloat) -> CGSize {
        let string = NSAttributedString(string: text, attributes: [NSFontAttributeName: font])
        let options = NSStringDrawingOptions.UsesLineFragmentOrigin
        let rect = string.boundingRectWithSize(
            CGSizeMake(width, 0),
            options: options,
            context: nil
        )
        return rect.size
    }


    /// MARK: - public api

    /**
     * get estimated size
     * @return CGSize
     */
    func cpd_size() -> CGSize {
        if self.text == nil { return CGSizeMake(self.frame.size.width, 0) }

        let string = NSAttributedString(string: self.text!, attributes: [NSFontAttributeName: self.font])
        let options = NSStringDrawingOptions.UsesLineFragmentOrigin
        let rect = string.boundingRectWithSize(
            self.frame.size,
            options: options,
            context: nil
        )
        return rect.size
    }

}
