import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Parolni tiklash",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "Xavotir olmang! Ro'yxatdan o'tgan telefon raqamingizni kiriting, biz sizga tasdiqlash kodini yuboramiz.",
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 40),
              
              // Telefon raqami kiritish joyi
              const Text(
                "Telefon raqami",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: "+998 ",
                  hintText: "90 123 45 67",
                  prefixIcon: const Icon(Icons.phone_android_outlined, size: 20),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Kodni yuborish tugmasi
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: () {
                  // Bu yerda kod yuborish mantiqi bo'ladi
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Tasdiqlash kodi yuborildi!")),
                  );
                },
                child: const Text(
                  "Kodni yuborish",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              
              const Spacer(),
              
              // Yordam markazi bilan bog'lanish
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Yordam kerakmi? Qo'llab-quvvatlash markazi",
                    style: TextStyle(color: Colors.blue, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}