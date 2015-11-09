import UIKit
import AVFoundation


class CPDArticleViewController: UIViewController {

    /// MARK: - property

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var speechSynthesizer = AVSpeechSynthesizer()
    var article: CPDArticle!
    var texts: [String] = []
    var selectedIndexPath = NSIndexPath(forRow: 0, inSection: 0)


    /// MARK: - life cycle

    override func loadView() {
        super.loadView()

        self.speechSynthesizer.delegate = self

        // title
        self.texts = [ "Paragraph: \(self.article.title)" ]
        // paragraphs
        let paragraphs = self.article.body.componentsSeparatedByString("\n\n")
        self.texts = self.texts + paragraphs
        // questions
        let questions = self.article.question.componentsSeparatedByString("\n\n")
        for var i = 0; i < questions.count; i++ {
            self.texts.append("Question \(i+1): \(questions[i])")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.stop()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    /// MARK: - event listener

    /**
     * called when button is touched up inside
     * @param button UIButton
     **/
    @IBAction func touchUpInside(button button: UIButton) {
        if button == self.playButton { self.play() }
        else if button == self.pauseButton { self.pause() }
        else if button == self.stopButton { self.stop() }
    }


    /// MARK: - private api

    /**
     * play TTS
     **/
    private func play() {
        if self.speechSynthesizer.paused {
            self.speechSynthesizer.continueSpeaking()
        }
        else {
            let text = self.texts[self.selectedIndexPath.row]

            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: self.article.language)
            //utterance.rate = 0.01
            //utterance.rate = 0.60
            utterance.rate = 0.45
            utterance.pitchMultiplier = AVSpeechUtteranceMaximumSpeechRate
            self.speechSynthesizer.speakUtterance(utterance)
        }
    }

    /**
     * pause TTS
     **/
    private func pause() {
        self.speechSynthesizer.pauseSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }

    /**
     * stop TTS
     **/
    private func stop() {
        self.speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }

}


/// MARK: - UITableViewDelegate, UITableViewDataSource
extension CPDArticleViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.texts.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = CPDArticleBodyTableViewCell.cpd_cell()

        let paragraph = self.texts[indexPath.row]
        let isSelected = (indexPath == self.selectedIndexPath)
        cell.design(paragraph: paragraph, isSelected: isSelected)

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath != self.selectedIndexPath {
            self.stop()
            self.selectedIndexPath = indexPath
            self.tableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let paragraph = self.texts[indexPath.row]
        return CPDArticleBodyTableViewCell.cpd_height(paragraph: paragraph)
    }

}


/// MARK: - AVSpeechSynthesizerDelegate
extension CPDArticleViewController: AVSpeechSynthesizerDelegate {

    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didStartSpeechUtterance utterance: AVSpeechUtterance) {
        self.playButton.hidden = true
        self.pauseButton.hidden = false
    }

    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        self.playButton.hidden = false
        self.pauseButton.hidden = true
    }

    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didPauseSpeechUtterance utterance: AVSpeechUtterance) {
        self.playButton.hidden = false
        self.pauseButton.hidden = true
    }

    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didContinueSpeechUtterance utterance: AVSpeechUtterance) {
        self.playButton.hidden = true
        self.pauseButton.hidden = false
    }

    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didCancelSpeechUtterance utterance: AVSpeechUtterance) {
        self.playButton.hidden = false
        self.pauseButton.hidden = true
    }

    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
    }

}
