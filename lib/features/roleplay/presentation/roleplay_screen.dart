import 'package:duolingo/features/roleplay/presentation/dialogue_session_screen.dart';
import 'package:flutter/material.dart';

class RoleplayScenario {
  final String id;
  final String titleTr;
  final String titleEn;
  final String emoji;
  final String level;
  final Color themeColor;
  final String description;
  final List<DialogueStep> steps;

  const RoleplayScenario({
    required this.id,
    required this.titleTr,
    required this.titleEn,
    required this.emoji,
    required this.level,
    required this.themeColor,
    required this.description,
    required this.steps,
  });
}

class RoleplayScreen extends StatelessWidget {
  const RoleplayScreen({Key? key}) : super(key: key);

  static const List<RoleplayScenario> scenarios = [
    RoleplayScenario(
      id: "cafe",
      titleTr: "Kahve Siparişi",
      titleEn: "Ordering at a Café",
      emoji: "☕",
      level: "A1 - Başlangıç",
      themeColor: Color(0xFFE07A5F),
      description: "Garson ile selamlaşın, en sevdiğiniz kahveyi ve tatlıyı sipariş edin.",
      steps: [
        DialogueStep(
          partnerSpeaker: "Panda Barista 🐼",
          partnerMessage: "Hello! Welcome to Panda Café. What can I get for you today?",
          partnerMessageTr: "Merhaba! Panda Kafe'ye hoş geldiniz. Bugün size ne getirebilirim?",
          expectedUserResponse: "Hi! I would like a cappuccino and a croissant, please.",
          expectedUserResponseTr: "Merhaba! Bir kapuçino ve bir kruvasan rica ediyorum.",
          userKeywords: ["hi", "cappuccino", "croissant", "please"],
        ),
        DialogueStep(
          partnerSpeaker: "Panda Barista 🐼",
          partnerMessage: "Great choice! Would you like regular milk or oat milk?",
          partnerMessageTr: "Harika seçim! Normal süt mü yoksa yulaf sütü mü istersiniz?",
          expectedUserResponse: "Oat milk, please. How much is it?",
          expectedUserResponseTr: "Yulaf sütü lütfen. Ne kadar tutuyor?",
          userKeywords: ["oat", "milk", "please", "how", "much"],
        ),
        DialogueStep(
          partnerSpeaker: "Panda Barista 🐼",
          partnerMessage: "That will be 5 dollars. You can tap your card here.",
          partnerMessageTr: "Toplam 5 dolar. Kartınızı buraya dokundurabilirsiniz.",
          expectedUserResponse: "Here you go. Thank you so much!",
          expectedUserResponseTr: "Buyrun. Çok teşekkür ederim!",
          userKeywords: ["here", "you", "go", "thank", "you"],
        ),
      ],
    ),
    RoleplayScenario(
      id: "hotel",
      titleTr: "Otelde Check-in",
      titleEn: "Hotel Check-in",
      emoji: "🏨",
      level: "A2 - Temel",
      themeColor: Color(0xFF3D5A80),
      description: "Otele vardığınızda rezervasyonunuzu doğrulayın ve oda anahtarınızı alın.",
      steps: [
        DialogueStep(
          partnerSpeaker: "Panda Resepsiyonist 🐼",
          partnerMessage: "Good evening! Welcome to the Grand Panda Hotel. Do you have a reservation?",
          partnerMessageTr: "İyi akşamlar! Grand Panda Otele hoş geldiniz. Rezervasyonunuz var mı?",
          expectedUserResponse: "Yes, I have a reservation under the name Ceylan.",
          expectedUserResponseTr: "Evet, Ceylan adına bir rezervasyonum var.",
          userKeywords: ["yes", "reservation", "under", "name"],
        ),
        DialogueStep(
          partnerSpeaker: "Panda Resepsiyonist 🐼",
          partnerMessage: "Found it! A deluxe room for 3 nights. Here is your key card for room 402.",
          partnerMessageTr: "Buldum! 3 gecelik lüks oda. İşte 402 numaralı oda için anahtar kartınız.",
          expectedUserResponse: "Thank you. What time is breakfast served in the morning?",
          expectedUserResponseTr: "Teşekkürler. Sabah kahvaltısı saat kaçta servis ediliyor?",
          userKeywords: ["thank", "what", "time", "breakfast"],
        ),
      ],
    ),
    RoleplayScenario(
      id: "airport",
      titleTr: "Havaalanında Danışma",
      titleEn: "At the Airport Gate",
      emoji: "✈️",
      level: "A2 - Pratik",
      themeColor: Color(0xFF2A9D8F),
      description: "Uçağınızın kalkış kapısını ve biniş saatini görevliye sorun.",
      steps: [
        DialogueStep(
          partnerSpeaker: "Panda Görevli 🐼",
          partnerMessage: "Hello! May I see your passport and boarding pass, please?",
          partnerMessageTr: "Merhaba! Pasaportunuzu ve biniş kartınızı görebilir miyim lütfen?",
          expectedUserResponse: "Sure, here is my boarding pass for flight TK 102.",
          expectedUserResponseTr: "Elbette, işte TK 102 sefer sayılı uçuşum için biniş kartım.",
          userKeywords: ["sure", "here", "boarding", "pass", "flight"],
        ),
        DialogueStep(
          partnerSpeaker: "Panda Görevli 🐼",
          partnerMessage: "Thank you. Your gate has changed to Gate B14. Boarding starts in 20 minutes.",
          partnerMessageTr: "Teşekkürler. Kapınız B14 olarak değişti. Biniş 20 dakika içinde başlıyor.",
          expectedUserResponse: "Got it! Which way is Gate B14?",
          expectedUserResponseTr: "Anladım! B14 kapısı ne tarafta kalıyor?",
          userKeywords: ["which", "way", "gate"],
        ),
      ],
    ),
    RoleplayScenario(
      id: "meeting",
      titleTr: "Yeni Biriyle Tanışma",
      titleEn: "Meeting a New Friend",
      emoji: "🤝",
      level: "A1 - Başlangıç",
      themeColor: Color(0xFFF4A261),
      description: "Kendinizi tanıtın, nereli olduğunuzu ve neler yaptığınızı paylaşın.",
      steps: [
        DialogueStep(
          partnerSpeaker: "Panda Arkadaş 🐼",
          partnerMessage: "Hi there! I'm Panda. It's really nice to meet you. Where are you from?",
          partnerMessageTr: "Selam! Ben Panda. Seninle tanıştığıma çok memnun oldum. Nerelisin?",
          expectedUserResponse: "Nice to meet you too! I am from Istanbul, Turkey.",
          expectedUserResponseTr: "Ben de tanıştığıma sevindim! Ben İstanbul, Türkiye'denim.",
          userKeywords: ["nice", "meet", "you", "from", "turkey"],
        ),
        DialogueStep(
          partnerSpeaker: "Panda Arkadaş 🐼",
          partnerMessage: "Istanbul is beautiful! What do you like to do in your free time?",
          partnerMessageTr: "İstanbul çok güzel bir şehir! Boş zamanlarında ne yapmaktan hoşlanırsın?",
          expectedUserResponse: "I love reading books, traveling, and learning new languages.",
          expectedUserResponseTr: "Kitap okumayı, seyahat etmeyi ve yeni diller öğrenmeyi severim.",
          userKeywords: ["love", "reading", "traveling", "learning", "languages"],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF58CC02), Color(0xFF2E7D32)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const Text("🐼", style: TextStyle(fontSize: 48)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Panda ile Canlı Diyalog",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Gerçek hayat senaryolarında konuşun, yapay zeka telaffuzunuzu analiz etsin!",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Günlük Konuşma Senaryoları",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C3C3C),
          ),
        ),
        const SizedBox(height: 12),
        ...scenarios.map((scenario) => _buildScenarioCard(context, scenario)).toList(),
      ],
    );
  }

  Widget _buildScenarioCard(BuildContext context, RoleplayScenario scenario) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DialogueSessionScreen(scenario: scenario),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: scenario.themeColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(scenario.emoji, style: const TextStyle(fontSize: 30)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              scenario.titleTr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: scenario.themeColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              scenario.level,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: scenario.themeColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        scenario.titleEn,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        scenario.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
