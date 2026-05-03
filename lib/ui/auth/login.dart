import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              
              // Tepadagi logotip
              Center(
                child: Image.asset(
                  'assets/images/bank_icon.png',
                  height: 100,
                ),
              ),
              
              const SizedBox(height: 24),
              const Text(
                "Xush kelibsiz",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Davom etish uchun tizimga kiring",
                style: TextStyle(color: Color(0xFF8E8E93), fontSize: 16),
              ),
              const SizedBox(height: 40),

              // Telefon raqami kiritish
              _buildInputLabel("Telefon raqami"),
              TextField(
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  prefixText: "+998 ",
                  // Mana shu yerda rang to'q qora qilindi
                  prefixStyle: const TextStyle(
                    color: Colors.black, 
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: "90 123 45 67",
                  hintStyle: const TextStyle(color: Color(0xFFC7C7CC)),
                  suffixIcon: const Icon(Icons.phone_outlined, color: Color(0xFF8E8E93)),
                  filled: true,
                  fillColor: const Color(0xFFF2F2F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
              
              const SizedBox(height: 24),

              // Parol kiritish
              _buildInputLabel("Parol"),
              TextField(
                obscureText: isVisible,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: const TextStyle(color: Color(0xFFC7C7CC)),
                  suffixIcon: IconButton(
                    icon: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    color: const Color(0xFF8E8E93),
                    onPressed: () => setState(() => isVisible = !isVisible),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF2F2F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/forgot'),
                  child: const Text(
                    "Parolni unutdingizmi?",
                    style: TextStyle(
                      color: Color(0xFFFF5722), 
                      fontSize: 14, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),

              // Kirish tugmasi
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                onPressed: () => Navigator.pushNamed(context, '/security'),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kirish",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.login_rounded, color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Text("yoki", style: TextStyle(color: Color(0xFFC7C7CC))),
              const SizedBox(height: 20),

              // Biometrika tugmasi
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  side: const BorderSide(color: Color(0xFFE5E5EA)),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fingerprint, color: Color(0xFFFF5722)),
                    SizedBox(width: 12),
                    Text(
                      "Biometrika bilan kirish",
                      style: TextStyle(
                        color: Color(0xFF1C1C1E), 
                        fontSize: 16, 
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Pastdagi Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/safe_bank_banner.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 32),

              // Ro'yxatdan o'tish qismi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hisobingiz yo'qmi? ",
                    style: TextStyle(color: Color(0xFF8E8E93), fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      "Ro'yxatdan o'tish",
                      style: TextStyle(
                        color: Color(0xFFFF5722), 
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Label yordamchi vidjeti
  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 4),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700, 
            fontSize: 16, 
            color: Color(0xFF1C1C1E),
          ),
        ),
      ),
    );
  }
}