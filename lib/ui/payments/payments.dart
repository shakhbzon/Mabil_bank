import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        title: const Text("To'lovlar", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Qidiruv paneli
            TextField(
              decoration: InputDecoration(
                hintText: "Xizmatlarni qidirish...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            const Text("Kategoriyalar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // To'lov kategoriyalari griddagi tugmalar
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              children: [
                _paymentCategory(Icons.phone_android, "Mobil", Colors.orange),
                _paymentCategory(Icons.language, "Internet", Colors.blue),
                _paymentCategory(Icons.lightbulb_outline, "Elektr", Colors.yellow.shade800),
                _paymentCategory(Icons.water_drop_outlined, "Suv", Colors.cyan),
                _paymentCategory(Icons.tv, "TV", Colors.purple),
                _paymentCategory(Icons.shield_outlined, "Sug'urta", Colors.green),
                _paymentCategory(Icons.home_work_outlined, "Kommunal", Colors.brown),
                _paymentCategory(Icons.more_horiz, "Barchasi", Colors.grey),
              ],
            ),
            
            const SizedBox(height: 30),
            const Text("Saqlangan to'lovlar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // Saqlangan to'lovlar ro'yxati
            _savedPayment("Mening raqamim", "+998 90 123 45 67", "Beeline", Icons.star_rounded, Colors.orange),
            _savedPayment("Uy interneti", "ID: 1548722", "Uzonline", Icons.wifi, Colors.blue),
            _savedPayment("Elektr energiya", "Hisob: 8854221", "Hududiy Elektr", Icons.bolt, Colors.yellow.shade900),
          ],
        ),
      ),
    );
  }

  Widget _paymentCategory(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
      ],
    );
  }

  Widget _savedPayment(String title, String subtitle, String provider, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
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
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(provider, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}