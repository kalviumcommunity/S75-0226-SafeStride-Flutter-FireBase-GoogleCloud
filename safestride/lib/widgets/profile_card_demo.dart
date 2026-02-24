import 'package:flutter/material.dart';

/// A demo widget that creates a profile card to demonstrate widget tree hierarchy
class ProfileCardDemo extends StatefulWidget {
  const ProfileCardDemo({super.key});

  @override
  State<ProfileCardDemo> createState() => _ProfileCardDemoState();
}

class _ProfileCardDemoState extends State<ProfileCardDemo> {
  // State variables for reactive UI
  bool isFavorite = false;
  String statusText = 'Online';
  Color statusColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card Demo'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 500 : isTablet ? 400 : double.infinity,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 16 : 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile image container
                      CircleAvatar(
                        radius: isMobile ? 40 : 50,
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(
                          Icons.person,
                          size: isMobile ? 40 : 50,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      
                      // Profile name
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isMobile ? 6 : 8),
                      
                      // Profile title
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      
                      // Status indicator
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            statusText,
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      
                      // Bio section
                      Container(
                        padding: EdgeInsets.all(isMobile ? 10 : 12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Passionate Flutter developer with expertise in building cross-platform applications. Love creating beautiful and responsive UIs.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      
                      // Action buttons
                      isMobile
                          ? Column(
                              children: [
                                // Toggle favorite button
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  icon: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : null,
                                    size: isMobile ? 18 : 20,
                                  ),
                                  label: Text(
                                    isFavorite ? 'Favorited' : 'Favorite',
                                    style: TextStyle(fontSize: isMobile ? 12 : 14),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Toggle status button
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      if (statusText == 'Online') {
                                        statusText = 'Offline';
                                        statusColor = Colors.red;
                                      } else {
                                        statusText = 'Online';
                                        statusColor = Colors.green;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.toggle_off, size: 20),
                                  label: Text(
                                    'Toggle Status',
                                    style: TextStyle(fontSize: isMobile ? 12 : 14),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Toggle favorite button
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  icon: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : null,
                                  ),
                                  label: Text(isFavorite ? 'Favorited' : 'Favorite'),
                                ),
                                
                                // Toggle status button
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      if (statusText == 'Online') {
                                        statusText = 'Offline';
                                        statusColor = Colors.red;
                                      } else {
                                        statusText = 'Online';
                                        statusColor = Colors.green;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.toggle_off),
                                  label: const Text('Toggle Status'),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}