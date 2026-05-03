import 'package:flutter/material.dart';
import 'home/dashboard.dart';
import 'monitoring/monitoring.dart';
import 'payments/payments.dart';
import 'profile/profile.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Dashboard(),
    const Monitoring(),
    const Payments(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF5722),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Asosiy"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: "Monitoring"),
          BottomNavigationBarItem(icon: Icon(Icons.payment_outlined), label: "To'lovlar"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profil"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}