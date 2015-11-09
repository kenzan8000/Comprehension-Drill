import UIKit
import AVFoundation


class CPDArticleViewController: UIViewController {

    /// MARK: - property

    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var playButton: UIButton!

    var article: CPDArticle!
    var paragraphs: [String] = []
    var speechSynthesizer = AVSpeechSynthesizer()


    /// MARK: - life cycle

    override func loadView() {
        super.loadView()

        // make paragraphs
        self.paragraphs = self.article.body.componentsSeparatedByString("\n\n")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


//    /// MARK: - event listener
//
//    /**
//     * called when button is touched up inside
//     * @param button UIButton
//     **/
//    @IBAction func touchUpInside(button button: UIButton) {
//        if button == self.playButton { self.play() }
//    }


    /// MARK: - private api

    /**
     * play TTS
     * @param paragraph String
     **/
    private func play(paragraph paragraph: String) {
        let utterance = AVSpeechUtterance(string: paragraph)
        utterance.voice = AVSpeechSynthesisVoice(language: self.article.language)
        //utterance.rate = 0.01
        //utterance.rate = 0.60
        utterance.rate = 0.45
        utterance.pitchMultiplier = AVSpeechUtteranceMaximumSpeechRate
        self.speechSynthesizer.speakUtterance(utterance)
    }

    /**
     * stop TTS
     **/
    private func stop() {
        self.speechSynthesizer.pauseSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }

/*
    public func stopSpeakingAtBoundary(boundary: AVSpeechBoundary) -> Bool
    public func pauseSpeakingAtBoundary(boundary: AVSpeechBoundary) -> Bool
    public func continueSpeaking() -> Bool
    public var speaking: Bool { get }
    public var paused: Bool { get }
*/

}


/// MARK: - UITableViewDelegate, UITableViewDataSource
extension CPDArticleViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paragraphs.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let paragraph = self.paragraphs[indexPath.row]

        let cell = CPDArticleBodyTableViewCell.cpd_cell()
        cell.design(paragraph: paragraph, isSelected: false)

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let paragraph = self.paragraphs[indexPath.row]
        self.play(paragraph: paragraph)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let paragraph = self.paragraphs[indexPath.row]
        return CPDArticleBodyTableViewCell.cpd_height(paragraph: paragraph)
    }

}

