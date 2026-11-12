import 'package:duolingo/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    @required this.question,
    @required this.prompt,
    @required this.options,
    @required this.correctIndex,
    @required this.explanation,
  });
}

class LessonData {
  final String id;
  final String title;
  final String icon;
  final Color color;
  final List<QuizQuestion> questions;

  const LessonData({
    @required this.id,
    @required this.title,
    @required this.icon,
    @required this.color,
    @required this.questions,
  });
}

class LessonExerciseScreen extends StatefulWidget {
  final LessonData lesson;

  const LessonExerciseScreen({@required this.lesson});

  @override
  _LessonExerciseScreenState createState() => _LessonExerciseScreenState();
}

class _LessonExerciseScreenState extends State<LessonExerciseScreen> {
  int _currentIndex = 0;
  int _selectedOption = -1;
  bool _isChecked = false;
  bool _isCorrect = false;
  int _hearts = 5;
  int _correctCount = 0;

  QuizQuestion get _currentQuestion => widget.lesson.questions[_currentIndex];

  void _checkAnswer() {
    if (_selectedOption == -1) return;

    final correct = _selectedOption == _currentQuestion.correctIndex;
    setState(() {
      _isChecked = true;
      _isCorrect = correct;
      if (correct) {
        _correctCount++;
      } else {
        if (_hearts > 1) {
          _hearts--;
        }
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.lesson.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = -1;
        _isChecked = false;
        _isCorrect = false;
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
          children: const <Widget>[
            Text("🏆", style: TextStyle(fontSize: 52)),
            SizedBox(height: 8),
            Text(
              "Ders Tamamlandı!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${widget.lesson.title} dersini başarıyla tamamladınız!",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF58CC02).withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text("⭐ +20 XP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF46A302))),
                  Text("👑 +1 Taç", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.amber)),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          PrimaryButton(
            "DEVAM ET",
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
  Widget build(BuildContext context) {
    final total = widget.lesson.questions.length;
    final progress = (_currentIndex + 1) / total;
    final q = _currentQuestion;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 14,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF58CC02)),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                const Icon(Icons.favorite, color: Color(0xFFFF4B4B), size: 26),
                const SizedBox(width: 4),
                Text(
                  "$_hearts",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFFFF4B4B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Text(
                  widget.lesson.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: widget.lesson.color,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  q.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
                const SizedBox(height: 20),

                // Soru İpucu / Cümle Kartı
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.volume_up, color: Color(0xFF1CB0F6), size: 28),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          q.prompt,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Seçenekler
                ...List<Widget>.generate(q.options.length, (index) {
                  final optionText = q.options[index];
                  final isSelected = _selectedOption == index;
                  final isCorrectOption = index == q.correctIndex;

                  Color borderColor = Colors.grey.shade300;
                  Color bgColor = Colors.white;
                  Color textColor = const Color(0xFF333333);

                  if (_isChecked) {
                    if (isCorrectOption) {
                      borderColor = const Color(0xFF58CC02);
                      bgColor = const Color(0xFF58CC02).withOpacity(0.12);
                      textColor = const Color(0xFF2E7D32);
                    } else if (isSelected && !isCorrectOption) {
                      borderColor = const Color(0xFFFF4B4B);
                      bgColor = const Color(0xFFFF4B4B).withOpacity(0.12);
                      textColor = const Color(0xFFD32F2F);
                    }
                  } else if (isSelected) {
                    borderColor = const Color(0xFF1CB0F6);
                    bgColor = const Color(0xFF1CB0F6).withOpacity(0.08);
                    textColor = const Color(0xFF0288D1);
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor, width: isSelected || (_isChecked && isCorrectOption) ? 2.5 : 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: _isChecked ? null : () => setState(() => _selectedOption = index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: borderColor.withOpacity(0.2),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  String.fromCharCode(65 + index),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  optionText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          // Alt Geri Bildirim ve İlerleme Alanı
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: _isChecked
                  ? (_isCorrect ? const Color(0xFFD7FFB8) : const Color(0xFFFFDFE0))
                  : Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (_isChecked) ...<Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          _isCorrect ? Icons.check_circle : Icons.cancel,
                          color: _isCorrect ? const Color(0xFF58CC02) : const Color(0xFFFF4B4B),
                          size: 32,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _isCorrect ? "Harika! Doğru cevap! 🎉" : "Doğru Cevap:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: _isCorrect ? const Color(0xFF46A302) : const Color(0xFFEA2B2B),
                                ),
                              ),
                              if (!_isCorrect)
                                Text(
                                  q.options[q.correctIndex],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                  PrimaryButton(
                    _isChecked ? "DEVAM ET" : "KONTROL ET",
                    color: _isChecked
                        ? (_isCorrect ? const Color(0xFF58CC02) : const Color(0xFFFF4B4B))
                        : (_selectedOption != -1 ? const Color(0xFF58CC02) : Colors.grey.shade400),
                    onPressed: _isChecked
                        ? _nextQuestion
                        : (_selectedOption != -1 ? _checkAnswer : null),
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
