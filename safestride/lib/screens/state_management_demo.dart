import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _counter = 0;
  bool _isFavorited = false;
  String _selectedCategory = 'All';

  final List<String> _categories = ['All', 'Restaurants', 'Cafes', 'Parks', 'Shopping'];

  final List<Map<String, dynamic>> _places = [
    {'name': 'Central Park', 'type': 'Parks', 'rating': 4.8, 'distance': '0.3 km', 'icon': Icons.park},
    {'name': 'The Coffee House', 'type': 'Cafes', 'rating': 4.5, 'distance': '0.5 km', 'icon': Icons.coffee},
    {'name': 'Pizza Palace', 'type': 'Restaurants', 'rating': 4.2, 'distance': '0.7 km', 'icon': Icons.local_pizza},
    {'name': 'City Mall', 'type': 'Shopping', 'rating': 4.0, 'distance': '1.1 km', 'icon': Icons.shopping_bag},
    {'name': 'Green Garden Cafe', 'type': 'Cafes', 'rating': 4.6, 'distance': '1.4 km', 'icon': Icons.eco},
    {'name': 'Burger Hub', 'type': 'Restaurants', 'rating': 4.3, 'distance': '1.8 km', 'icon': Icons.lunch_dining},
  ];

  List<Map<String, dynamic>> get _filteredPlaces {
    if (_selectedCategory == 'All') return _places;
    return _places.where((p) => p['type'] == _selectedCategory).toList();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  Color get _counterColor {
    if (_counter >= 10) return Colors.red;
    if (_counter >= 5) return Colors.orange;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('State Demo — Nearby Places'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              color: _isFavorited ? Colors.red : Colors.grey,
            ),
            onPressed: _toggleFavorite,
            tooltip: 'Toggle Favorite',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _counterColor,
                ),
                child: Text('Taps: $_counter'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // State info banner
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: _isFavorited ? Colors.red.shade50 : Colors.blue.shade50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Icon(
                  _isFavorited ? Icons.favorite : Icons.info_outline,
                  color: _isFavorited ? Colors.red : Colors.blue,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  _isFavorited
                      ? 'Area saved to favorites! ❤️'
                      : 'Tap ♡ to save this area. setState() updates the UI instantly.',
                  style: TextStyle(
                    fontSize: 13,
                    color: _isFavorited ? Colors.red.shade700 : Colors.blue.shade700,
                  ),
                ),
              ],
            ),
          ),

          // Category filter chips
          SizedBox(
            height: 56,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final cat = _categories[index];
                final isSelected = _selectedCategory == cat;
                return GestureDetector(
                  onTap: () => _selectCategory(cat),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey.shade300,
                      ),
                      boxShadow: isSelected
                          ? [BoxShadow(color: Colors.blue.shade100, blurRadius: 6)]
                          : [],
                    ),
                    child: Text(
                      cat,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Fake map view
          Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFE8F5E9),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomPaint(
                    painter: _FakeMapPainter(),
                    child: Container(),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, color: Colors.red, size: 36),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                        ),
                        child: Text(
                          'Showing ${_filteredPlaces.length} places',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Results count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                Text(
                  '${_filteredPlaces.length} results · $_selectedCategory',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Place cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              itemCount: _filteredPlaces.length,
              itemBuilder: (context, index) {
                final place = _filteredPlaces[index];
                return GestureDetector(
                  onTap: _incrementCounter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(place['icon'] as IconData, color: Colors.blue, size: 26),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place['name'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 14),
                                  const SizedBox(width: 3),
                                  Text(
                                    '${place['rating']}',
                                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.near_me, size: 13, color: Colors.grey),
                                  const SizedBox(width: 3),
                                  Text(
                                    place['distance'] as String,
                                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // FAB tap counter
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.touch_app, color: Colors.white),
        label: Text(
          'Tapped $_counter×',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Custom painter to simulate a map background
class _FakeMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final blockPaint = Paint()
      ..color = const Color(0xFFD0ECD0)
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), blockPaint);

    // Horizontal roads
    for (double y = 30; y < size.height; y += 45) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), roadPaint);
    }
    // Vertical roads
    for (double x = 40; x < size.width; x += 60) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), roadPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}