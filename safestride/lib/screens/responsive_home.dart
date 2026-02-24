import 'package:flutter/material.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {

    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Check if tablet
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SafeStride"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          // Header Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isTablet ? 24 : 16),
            color: Colors.blue,
            child: Text(
              "Discover Safe Routes",
              style: TextStyle(
                fontSize: isTablet ? 28 : 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Main Content
          Expanded(
            child: isTablet
                ? tabletLayout()
                : phoneLayout(),
          ),

          // Footer Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isTablet ? 20 : 12),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Start Tracking",
                style: TextStyle(
                  fontSize: isTablet ? 20 : 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Phone Layout
  Widget phoneLayout() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        routeCard("Morning Run", "3.5 km", "⭐⭐⭐⭐"),
        routeCard("Park Loop", "5 km", "⭐⭐⭐⭐⭐"),
        routeCard("City Ride", "10 km", "⭐⭐⭐"),
      ],
    );
  }

  // Tablet Layout
  Widget tabletLayout() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      childAspectRatio: 3,
      children: [
        routeCard("Morning Run", "3.5 km", "⭐⭐⭐⭐"),
        routeCard("Park Loop", "5 km", "⭐⭐⭐⭐⭐"),
        routeCard("City Ride", "10 km", "⭐⭐⭐"),
        routeCard("River Route", "7 km", "⭐⭐⭐⭐"),
      ],
    );
  }

  // Reusable Card
  Widget routeCard(String title, String distance, String rating) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [

            const Icon(Icons.route, size: 40),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(distance),
                  Text(rating),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
