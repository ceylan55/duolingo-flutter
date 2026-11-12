import 'dart:async';
import 'package:duolingo/features/roleplay/presentation/roleplay_screen.dart';
import 'package:duolingo/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DialogueStep {
  final String partnerSpeaker;
  final String partnerMessage;
  final String partnerMessageTr;
  final String expectedUserResponse;
  final String expectedUserResponseTr;
  final List<String> userKeywords;

  const DialogueStep({
    required this.partnerSpeaker,
    required this.partnerMessage,
    required this.partnerMessageTr,
    required this.expectedUserResponse,
    required this.expectedUserResponseTr,
    required this.userKeywords,
  });
}

class DialogueSessionScreen extends StatefulWidget {
  final RoleplayScenario scenario;

  const DialogueSessionScreen({Key? key, required this.scenario}) : super(key: key);

  @override
  _DialogueSessionScreenState createState() => _DialogueSessionScreenState();
}

class _DialogueSessionScreenState extends State<DialogueSessionScreen> {
  int _currentStepIndex = 0;
  bool _isListening = false;
  bool _hasSpoken = false;
  int _scorePercent = 0;
  bool _showTranslation = false;
  Timer? _recordingTimer;

  DialogueStep get _currentStep => widget.scenario.steps[_currentStepIndex];

  void _startVoiceAnalysis() {
    setState(() {
      _isListening = true;
      _hasSpoken = false;
    });

    _recordingTimer?.cancel();
    _recordingTimer = Timer(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      setState(() {
        _isListening = false;
        _hasSpoken = true;
        _scorePercent = 94; // Başarılı telaffuz puanı
      });
    });
  }

  void _nextStep() {
    if (_currentStepIndex < widget.scenario.steps.length - 1) {
      setState(() {
        _currentStepIndex++;
        _isListening = false;
        _hasSpoken = false;
        _scorePercent = 0;
        _showTranslation = false;
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: const [
            Text("🎉", style: TextStyle(fontSize: 48)),
            SizedBox(height: 8),
            Text(
              "Tebrikler!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${widget.scenario.titleTr} diyalogunu başarıyla tamamladınız!",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF58CC02).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("⭐ +35 XP", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF46A302))),
                  SizedBox(width: 16),
                  Text("🔥 Streak Devam", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF9600))),
                ],
              ),
            ),
          ],
        ),
        actions: [
          PrimaryButton(
            "TAMAMLA",
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final step = _currentStep;
    final totalSteps = widget.scenario.steps.length;
    final progress = (_currentStepIndex + 1) / totalSteps;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF58CC02)),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            child: Text(
              "${_currentStepIndex + 1}/$totalSteps",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Partner (Panda) Konuşması
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF58CC02), width: 2),
                      ),
                      alignment: Alignment.center,
                      child: const Text("🐼", style: TextStyle(fontSize: 28)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  step.partnerSpeaker,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF58CC02)),
                                ),
                                const Spacer(),
                                const Icon(Icons.volume_up, color: Color(0xFF1CB0F6), size: 20),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              step.partnerMessage,
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFF2B2B2B)),
                            ),
                            if (_showTranslation) ...[
                              const SizedBox(height: 6),
                              Text(
                                step.partnerMessageTr,
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontStyle: FontStyle.italic),
                              ),
                            ],
                            const SizedBox(height: 6),
                            GestureDetector(
                              onTap: () => setState(() => _showTranslation = !_showTranslation),
                              child: Text(
                                _showTranslation ? "Çeviriyi Gizle" : "Türkçe Çeviriyi Gör",
                                style: const TextStyle(fontSize: 12, color: Color(0xFF1CB0F6), fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // Kullanıcının Sırası
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "🎤 Sizin Sıranız: Mikrofonla Sesli Söyleyin",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1CB0F6)),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Hedef Yanıt Kartı
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _hasSpoken ? const Color(0xFF58CC02) : Colors.grey.shade300,
                      width: _hasSpoken ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step.expectedUserResponse,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _hasSpoken ? const Color(0xFF2E7D32) : const Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        step.expectedUserResponseTr,
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                      ),
                      if (_hasSpoken) ...[
                        const Divider(height: 24),
                        Row(
                          children: [
                            const Icon(Icons.check_circle, color: Color(0xFF58CC02), size: 24),
                            const SizedBox(width: 8),
                            Text(
                              "Telaffuz Başarısı: %$_scorePercent (Harika!)",
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF46A302)),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Alt Bar & Mikrofon Butonu
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: SafeArea(
              child: _hasSpoken
                  ? PrimaryButton(
                      _currentStepIndex < totalSteps - 1 ? "DEVAM ET" : "TAMAMLA",
                      onPressed: _nextStep,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _isListening ? null : _startVoiceAnalysis,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _isListening ? const Color(0xFFFF4B4B) : const Color(0xFF1CB0F6),
                              boxShadow: [
                                BoxShadow(
                                  color: (_isListening ? const Color(0xFFFF4B4B) : const Color(0xFF1CB0F6))
                                      .withOpacity(0.35),
                                  blurRadius: _isListening ? 16 : 8,
                                  spreadRadius: _isListening ? 4 : 1,
                                ),
                              ],
                            ),
                            child: Icon(
                              _isListening ? Icons.mic : Icons.mic_none,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
