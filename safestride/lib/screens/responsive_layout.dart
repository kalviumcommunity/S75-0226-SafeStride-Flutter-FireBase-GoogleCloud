import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Layout"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: isTablet
            ? Row(
                children: [
                  Expanded(child: buildProfileCard()),
                  const SizedBox(width: 16),
                  Expanded(child: buildDashboard()),
                ],
              )
            : Column(
                children: [
                  buildProfileCard(),
                  const SizedBox(height: 16),
                  Expanded(child: buildDashboard()),
                ],
              ),
      ),
    );
  }

  Widget buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40),
          ),

          SizedBox(height: 10),

          Text(
            "John Doe",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),

          Text(
            "Flutter Developer",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget buildDashboard() {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [
          buildCard("Projects", "12"),
          const SizedBox(height: 10),
          buildCard("Tasks", "34"),
          const SizedBox(height: 10),
          buildCard("Messages", "5"),
        ],
      ),
    );
  }

  Widget buildCard(String title, String value) {
    return Expanded(
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Text(
                value,
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}