import 'package:duolingo/core/demo_stats.dart';
import 'package:flutter/material.dart';

const TextStyle _titleStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Row(
            children: <Widget>[
              const Expanded(child: Text("Öğrenci", style: _titleStyle)),
              ClipOval(
                child: Image.asset(
                  "assets/images/logo-with-duo.png",
                  width: 96,
                  height: 96,
                  semanticLabel: "Profil fotoğrafı",
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          const Text("İstatistikler", style: _titleStyle),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2.1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              const _StatCard(
                Icon(Icons.bolt, color: Colors.amber, size: 32),
                demoXp,
                "Toplam XP",
              ),
              _StatCard(_statImage("navbar_fire"), demoStreak, "Günlük Seri"),
              _StatCard(_statImage("crown_stroke"), demoCrowns, "Taçlar"),
              _StatCard(_statImage("navbar_diamont"), demoGems, "Elmaslar"),
            ],
          ),
          const SizedBox(height: 30),
          const Text("Arkadaşlar", style: _titleStyle),
          const SizedBox(height: 8),
          Text(
            "Henüz burada bir arkadaşınız yok.",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      );

  static Widget _statImage(String name) =>
      Image.asset("assets/images/appBar/$name.png", height: 32);
}

class _StatCard extends StatelessWidget {
  final Widget icon;
  final int value;
  final String label;

  const _StatCard(this.icon, this.value, this.label);

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: <Widget>[
              icon,
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$value",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
