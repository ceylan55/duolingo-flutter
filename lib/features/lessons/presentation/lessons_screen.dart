import 'package:duolingo/features/lessons/presentation/lesson_bubble.dart';
import 'package:duolingo/features/lessons/presentation/lesson_exercise_screen.dart';
import 'package:duolingo/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

final LessonData _basicsLesson = const LessonData(
  id: "basics",
  title: "Temeller 1",
  icon: "egg",
  color: Color(0xFF58CC02),
  questions: <QuizQuestion>[
    QuizQuestion(
      question: "'Hello' kelimesinin Türkçe karşılığı nedir?",
      prompt: "Hello! Welcome to Pipi Talk.",
      options: <String>["Merhaba", "Hoşça kal", "Teşekkürler", "Evet"],
      correctIndex: 0,
      explanation: "'Hello' İngilizcede 'Merhaba' anlamına gelir.",
    ),
    QuizQuestion(
      question: "'I drink water' cümlesinin doğru anlamı nedir?",
      prompt: "I drink water every day.",
      options: <String>["Ben su içerim", "O çay içer", "Su soğuktur", "Bir bardak süt"],
      correctIndex: 0,
      explanation: "'drink' içmek, 'water' ise su demektir.",
    ),
    QuizQuestion(
      question: "'Thank you' ifadesi ne anlama gelir?",
      prompt: "Thank you very much!",
      options: <String>["Teşekkür ederim", "Özür dilerim", "Günaydın", "Rica ederim"],
      correctIndex: 0,
      explanation: "'Thank you' teşekkür etmek için kullanılır.",
    ),
  ],
);

final LessonData _greetingsLesson = const LessonData(
  id: "greetings",
  title: "Selamlaşma",
  icon: "dialog",
  color: Color(0xFF1CB0F6),
  questions: <QuizQuestion>[
    QuizQuestion(
      question: "'Good morning' sabahları ne anlama gelir?",
      prompt: "Good morning, my friend!",
      options: <String>["Günaydın", "İyi akşamlar", "Görüşürüz", "İyi geceler"],
      correctIndex: 0,
      explanation: "'Good morning' sabah selamlaşmasıdır (Günaydın).",
    ),
    QuizQuestion(
      question: "'How are you?' sorusuyla ne sorulur?",
      prompt: "Hi, how are you today?",
      options: <String>["Nasılsın?", "Nerelisin?", "Adın ne?", "Saat kaç?"],
      correctIndex: 0,
      explanation: "'How are you?' bir kişinin halini hatırını sormaktır.",
    ),
    QuizQuestion(
      question: "'See you later' ne demektir?",
      prompt: "Goodbye, see you later!",
      options: <String>["Sonra görüşürüz", "Hoş geldin", "İyi şanslar", "Afiyet olsun"],
      correctIndex: 0,
      explanation: "'See you later' ayrılırken 'Sonra görüşmek üzere' anlamındadır.",
    ),
  ],
);

final LessonData _travelLesson = const LessonData(
  id: "travel",
  title: "Seyahat",
  icon: "airplane",
  color: Color(0xFFFF9600),
  questions: <QuizQuestion>[
    QuizQuestion(
      question: "'Where is the airport?' cümlesi ne anlama gelir?",
      prompt: "Excuse me, where is the airport?",
      options: <String>["Havaalanı nerede?", "Otel ne kadar uzak?", "Bilet alabilir miyim?", "Tren nerede?"],
      correctIndex: 0,
      explanation: "'Airport' havaalanı, 'where' nerede demektir.",
    ),
    QuizQuestion(
      question: "'I have a ticket' cümlesi nedir?",
      prompt: "Yes, I have a ticket for the train.",
      options: <String>["Bir biletim var", "Bavulum hazır", "Pasaportumu kaybettim", "Uçak kalkıyor"],
      correctIndex: 0,
      explanation: "'Ticket' bilet demektir.",
    ),
    QuizQuestion(
      question: "'Hotel' kelimesi nedir?",
      prompt: "Our hotel is near the city center.",
      options: <String>["Otel", "Müze", "Restoran", "Durak"],
      correctIndex: 0,
      explanation: "'Hotel' konaklanan otel anlamına gelir.",
    ),
  ],
);

final LessonData _foodLesson = const LessonData(
  id: "food",
  title: "Kafe & Yemek",
  icon: "hamburger",
  color: Color(0xFFFF4B4B),
  questions: <QuizQuestion>[
    QuizQuestion(
      question: "'A cup of coffee, please' ne demektir?",
      prompt: "Can I have a cup of coffee, please?",
      options: <String>["Bir fincan kahve lütfen", "Bir bardak çay", "Bir dilim pasta", "Hesap lütfen"],
      correctIndex: 0,
      explanation: "'Coffee' kahve, 'please' lütfen demektir.",
    ),
    QuizQuestion(
      question: "'Bread and cheese' ifadesi nedir?",
      prompt: "I eat bread and cheese for breakfast.",
      options: <String>["Ekmek ve peynir", "Bal ve kaymak", "Çorba ve salata", "Elma ve muz"],
      correctIndex: 0,
      explanation: "'Bread' ekmek, 'cheese' peynir demektir.",
    ),
    QuizQuestion(
      question: "'The bill, please' ne zaman söylenir?",
      prompt: "We are finished. The bill, please.",
      options: <String>["Hesap lütfen (ödemek için)", "Menü lütfen", "Su alabilir miyim", "Masa ayırtmak istiyorum"],
      correctIndex: 0,
      explanation: "'The bill' restoranda hesap anlamına gelir.",
    ),
  ],
);

final LessonData _familyLesson = const LessonData(
  id: "family",
  title: "Aile",
  icon: "baby",
  color: Color(0xFFCE82FF),
  questions: <QuizQuestion>[
    QuizQuestion(
      question: "'Mother and father' ne demektir?",
      prompt: "My mother and father are at home.",
      options: <String>["Anne ve baba", "Kardeş ve abla", "Teyze ve amca", "Dede ve nine"],
      correctIndex: 0,
      explanation: "'Mother' anne, 'father' baba demektir.",
    ),
    QuizQuestion(
      question: "'This is my brother' cümlesi nedir?",
      prompt: "Hello, this is my brother Ali.",
      options: <String>["Bu benim erkek kardeşim", "Bu benim babam", "Bu benim arkadaşım", "Bu benim öğretmenim"],
      correctIndex: 0,
      explanation: "'Brother' erkek kardeş demektir.",
    ),
    QuizQuestion(
      question: "'We are a happy family' ne anlama gelir?",
      prompt: "We are a happy family.",
      options: <String>["Biz mutlu bir aileyiz", "Biz büyük bir okuluz", "Biz iyi komşularız", "Biz evdeyiz"],
      correctIndex: 0,
      explanation: "'Family' aile, 'happy' mutlu demektir.",
    ),
  ],
);

void _openLesson(BuildContext context, LessonData lesson) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheetContext) => Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${lesson.title} 🌟",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "${lesson.questions.length} pratik soru ile konuşma ve kelime becerilerinizi geliştirin.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            "BAŞLA (+20 XP)",
            color: lesson.color,
            onPressed: () {
              Navigator.of(sheetContext).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => LessonExerciseScreen(lesson: lesson),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

class LessonsScreen extends StatelessWidget {
  const LessonsScreen();

  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> rows = <List<Widget>>[
      <Widget>[
        LessonBubble("Temeller", "egg", onTap: (ctx) => _openLesson(ctx, _basicsLesson)),
      ],
      <Widget>[
        LessonBubble("Selamlaşma", "dialog", onTap: (ctx) => _openLesson(ctx, _greetingsLesson)),
        LessonBubble("Seyahat", "airplane", onTap: (ctx) => _openLesson(ctx, _travelLesson)),
      ],
      <Widget>[
        LessonBubble("Kafe & Yemek", "hamburger", onTap: (ctx) => _openLesson(ctx, _foodLesson)),
        LessonBubble("Aile", "baby", onTap: (ctx) => _openLesson(ctx, _familyLesson)),
      ],
    ];

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 38),
      children: <Widget>[
        for (final row in rows)
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row,
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Expanded(child: _CheckpointLine()),
            Image.asset(
              "assets/images/home_screen/lesson_divisor_castle.png",
              height: 85,
              semanticLabel: "Kontrol noktası",
            ),
            const Expanded(child: _CheckpointLine()),
          ],
        ),
      ],
    );
  }
}

class _CheckpointLine extends StatelessWidget {
  const _CheckpointLine();

  @override
  Widget build(BuildContext context) => Divider(
        color: Colors.grey.shade300,
        height: 50,
        thickness: 2,
        indent: 12,
        endIndent: 12,
      );
}
