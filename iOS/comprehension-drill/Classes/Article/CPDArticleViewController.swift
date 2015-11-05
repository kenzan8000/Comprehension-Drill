import UIKit
import AVFoundation


class CPDArticleViewController: UIViewController {

    /// MARK: - property

    var article: CPDArticle!
    var speechSynthesizer = AVSpeechSynthesizer()


    /// MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        //CPDLOG(self.article)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    /// MARK: - event listener


    /// MARK: - private api

    /**
     * play TTS
     **/
    private func play() {
        let utterance = AVSpeechUtterance(string: self.article.body)
        utterance.voice = AVSpeechSynthesisVoice(language: self.article.language)
        utterance.rate = 0.2
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
