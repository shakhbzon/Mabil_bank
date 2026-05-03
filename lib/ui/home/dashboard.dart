import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Profil va Bildirishnoma
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.orange.shade100,
                        child: const Text("AR", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Xush kelibsiz,", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Text("Aziz Rahimov", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none_rounded, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Asosiy Balans Kartasi (Ko'k gradient)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2D79E6), Color(0xFF09398E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Umumiy hisob balansi", style: TextStyle(color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 8),
                    const Text(
                      "12 450 000 UZS",
                      style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("**** 4582", style: TextStyle(color: Colors.white, letterSpacing: 2)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text("Humo", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Tezkor amallar (4 ta tugma)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickAction(Icons.swap_horiz_rounded, "O'tkazma", Colors.orange),
                  _quickAction(Icons.qr_code_2_rounded, "QR To'lov", Colors.blue),
                  _quickAction(Icons.account_balance_wallet_rounded, "To'lovlar", Colors.green),
                  _quickAction(Icons.grid_view_rounded, "Ko'proq", Colors.purple),
                ],
              ),
              const SizedBox(height: 30),

              // Oxirgi tranzaksiyalar sarlavhasi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Oxirgi tranzaksiyalar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: const Text("Barchasi", style: TextStyle(color: Colors.orange))),
                ],
              ),

              // Tranzaksiyalar ro'yxati
              _transactionItem("Korzinka.uz", "Bugun, 14:30", "- 145 000 UZS", Icons.shopping_basket_outlined, Colors.red),
              _transactionItem("O'tkazma qabul qilindi", "Kecha, 09:15", "+ 500 000 UZS", Icons.arrow_downward_rounded, Colors.green),
              _transactionItem("Beeline To'lov", "12-Aprel, 18:40", "- 30 000 UZS", Icons.phone_android_rounded, Colors.orange),
            ],
          ),
        ),
      ),
    );
  }

  // Tezkor amallar vidjeti
  Widget _quickAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  // Tranzaksiya qatori vidjeti
  Widget _transactionItem(String title, String date, String amount, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: amount.startsWith('+') ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}