import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisible = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Ro'yxatdan o'tish", style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hisob yaratish",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Davom etish uchun ma'lumotlaringizni kiriting va bank xizmatlaridan foydalaning.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 32),
              
              // To'liq ism
              _buildLabel("To'liq ism"),
              _buildTextField(hint: "Ism va familiyangizni kiriting", icon: Icons.person_outline),
              
              const SizedBox(height: 20),
              
              // Telefon raqami
              _buildLabel("Telefon raqami"),
              _buildTextField(
                hint: "90 123 45 67", 
                icon: Icons.phone_android_outlined, 
                prefix: "+998 ",
                keyboardType: TextInputType.phone
              ),
              
              const SizedBox(height: 20),
              
              // Parol yaratish
              _buildLabel("Parol yaratish"),
              _buildTextField(
                hint: "Kamida 8 ta belgi", 
                icon: Icons.lock_outline,
                isPassword: true,
                isVisible: isVisible,
                onToggleVisible: () => setState(() => isVisible = !isVisible),
              ),
              
              const SizedBox(height: 16),
              
              // Shartlarga rozilik
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: const Color(0xFFFF5722),
                    onChanged: (val) => setState(() => isChecked = val!),
                  ),
                  const Expanded(
                    child: Text(
                      "Men foydalanish shartlari va maxfiylik siyosatiga roziman.",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Ro'yxatdan o'tish tugmasi
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: isChecked ? () {
                  // Muvaffaqiyatli ro'yxatdan o'tgach, PIN-kod o'rnatishga yuboramiz
                  Navigator.pushNamed(context, '/security');
                } : null, // Shartlarga rozi bo'lmasa tugma ishlamaydi
                child: const Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Login sahifasiga qaytish
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Profilingiz bormi? "),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Tizimga kirish",
                      style: TextStyle(color: Color(0xFFFF5722), fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    );
  }

  Widget _buildTextField({
    required String hint, 
    required IconData icon, 
    String? prefix,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onToggleVisible,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: isPassword && isVisible,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefix,
        prefixIcon: Icon(icon, color: Colors.grey, size: 20),
        suffixIcon: isPassword 
          ? IconButton(
              icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility, size: 20),
              onPressed: onToggleVisible,
            )
          : null,
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}