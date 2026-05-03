import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Profil rasmi va ismi
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.orange.shade100,
                        child: const Text("AR", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                        child: const Icon(Icons.edit, color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text("Aziz Rahimov", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text("+998 90 123 45 67", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Sozlamalar ro'yxati
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(top: 20),
                  children: [
                    _profileMenuItem(Icons.person_outline, "Shaxsiy ma'lumotlar", Colors.blue),
                    _profileMenuItem(Icons.account_balance_wallet_outlined, "Mening kartalarim", Colors.green),
                    _profileMenuItem(Icons.security_outlined, "Xavfsizlik sozlamalari", Colors.orange),
                    _profileMenuItem(Icons.language_outlined, "Tilni o'zgartirish", Colors.purple),
                    _profileMenuItem(Icons.help_outline_rounded, "Qo'llab-quvvatlash", Colors.teal),
                    const Divider(height: 40),
                    _profileMenuItem(Icons.logout_rounded, "Chiqish", Colors.red, isExit: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileMenuItem(IconData icon, String title, Color color, {bool isExit = false}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isExit ? Colors.red : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Chiqish bosilganda login sahifasiga qaytish mantiqi bo'lishi mumkin
      },
    );
  }
}