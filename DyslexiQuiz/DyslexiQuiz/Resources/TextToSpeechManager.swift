//
//  TextToSpeechManager.swift
//  DyslexiQuiz
//
//  Created by Jordan Weinstein on 1/7/24.
//

import AVFoundation

class TextToSpeechManager {
    private var _synthesizer: AVSpeechSynthesizer?

    private var synthesizer: AVSpeechSynthesizer {
        if _synthesizer == nil {
            _synthesizer = AVSpeechSynthesizer()
        }
        return _synthesizer!
    }

    func speak(input: String) {
        let speechUtterance = AVSpeechUtterance(string: input)
        speechUtterance.rate = 0.5
        speechUtterance.volume = 1.0
        speechUtterance.pitchMultiplier = 1.1
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        synthesizer.speak(speechUtterance)
    }
}
