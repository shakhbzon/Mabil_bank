import 'package:flutter/material.dart';

class SecurityAuth extends StatefulWidget {
  const SecurityAuth({super.key});

  @override
  State<SecurityAuth> createState() => _SecurityAuthState();
}

class _SecurityAuthState extends State<SecurityAuth> {
  String pinCode = "";

  void _onKeyTap(String val) {
    if (pinCode.length < 4) {
      setState(() => pinCode += val);
    }
    if (pinCode.length == 4) {
      // PIN to'lganda Dashboardga o'tamiz
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Icon(Icons.fingerprint, size: 80, color: Colors.blue),
          const SizedBox(height: 20),
          const Text("Xavfsizlik va Tasdiqlash", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Iltimos, shaxsingizni tasdiqlash uchun barmog'izdan yoki Face ID-dan foydalaning.", textAlign: TextAlign.center),
          ),
          const Spacer(),
          // PIN nuqtalari
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) => Container(
              margin: const EdgeInsets.all(8),
              width: 15, height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index < pinCode.length ? Colors.blue : Colors.grey.shade300,
              ),
            )),
          ),
          const SizedBox(height: 40),
          // Raqamli klaviatura
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.grey.shade50,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              children: [
                ...["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0"].map((e) => TextButton(
                  onPressed: e == "" ? null : () => _onKeyTap(e),
                  child: Text(e, style: const TextStyle(fontSize: 24, color: Colors.black)),
                )),
                IconButton(
                  onPressed: () => setState(() { if(pinCode.isNotEmpty) pinCode = pinCode.substring(0, pinCode.length - 1); }),
                  icon: const Icon(Icons.backspace_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}