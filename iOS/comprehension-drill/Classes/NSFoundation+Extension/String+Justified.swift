import Foundation


/// MARK: - String+Justified
extension String {

    /// MARK: - public api

    /**
     * get justified string
     * @param font UIFont
     * @return NSAttributedString
     **/
    func cpd_justifiedString(font font: UIFont) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Justified
        paragraphStyle.firstLineHeadIndent = 0.001
        return NSAttributedString(
            string: self,
            attributes: [
                NSFontAttributeName: font,
                NSParagraphStyleAttributeName: paragraphStyle,
            ]
        )
    }

}
