import 'package:duolingo/features/lessons/presentation/lesson_bubble.dart';
import 'package:duolingo/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

void _showIntroduction(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) => Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            "Temeller 1 🟢",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Temel selamlaşmalar, nezaket ifadeleri ve basit cümle yapıları ile İngilizceye ilk adımı atın.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            "ANLADIM, BAŞLA",
            onPressed: () => Navigator.of(sheetContext).pop(),
          ),
        ],
      ),
    ),
  );
}

const List<List<LessonBubble>> _rows = <List<LessonBubble>>[
  <LessonBubble>[
    LessonBubble("Temeller", "egg", onTap: _showIntroduction),
  ],
  <LessonBubble>[
    LessonBubble("Selamlaşma", "dialog"),
    LessonBubble("Seyahat", "airplane"),
  ],
  <LessonBubble>[
    LessonBubble("Kafe & Yemek", "hamburger"),
    LessonBubble("Aile", "baby"),
  ],
];

class LessonsScreen extends StatelessWidget {
  const LessonsScreen();

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 38),
        children: <Widget>[
          for (final row in _rows)
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
                semanticLabel: "Ponto de controle",
              ),
              const Expanded(child: _CheckpointLine()),
            ],
          ),
        ],
      );
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
