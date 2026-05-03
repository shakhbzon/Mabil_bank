import 'package:flutter/material.dart';

class Monitoring extends StatelessWidget {
  const Monitoring({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        title: const Text("Monitoring", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Investitsiya portfeli", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Portfel balansi kartasi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: const Column(
                children: [
                  Text("Jami daromad", style: TextStyle(color: Colors.grey)),
                  Text("+ 2 450 000 UZS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(height: 10),
                  Text("O'tgan oyga nisbatan +12%", style: TextStyle(color: Colors.green, fontSize: 12)),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            const Text("Xarajatlar tahlili", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Grafik o'rniga vaqtincha vizual indikatorlar
            _analysisItem("Oziq-ovqat", "45%", Colors.orange, 0.45),
            _analysisItem("Transport", "20%", Colors.blue, 0.2),
            _analysisItem("Ko'ngilochar", "15%", Colors.purple, 0.15),
            _analysisItem("Boshqa", "20%", Colors.grey, 0.2),
            
            const SizedBox(height: 30),
            const Text("Sizning aksiyalaringiz", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            _stockItem("Apple Inc.", "AAPL", "+2.5%", "175.40 \$"),
            _stockItem("Tesla Motors", "TSLA", "-1.2%", "210.15 \$"),
          ],
        ),
      ),
    );
  }

  Widget _analysisItem(String label, String percent, Color color, double progress) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text(percent, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            color: color,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }

  Widget _stockItem(String name, String symbol, String change, String price) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(backgroundColor: Colors.grey.shade100, child: const Icon(Icons.trending_up, color: Colors.blue)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(symbol),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(change, style: TextStyle(color: change.startsWith('+') ? Colors.green : Colors.red, fontSize: 12)),
        ],
      ),
    );
  }
}