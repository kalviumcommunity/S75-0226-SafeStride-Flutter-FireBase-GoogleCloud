import 'package:flutter/material.dart';
 multi_screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 800 : isTablet ? 600 : double.infinity,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to SafeStride Home!',
                    style: TextStyle(
                      fontSize: isMobile ? 20 : isTablet ? 24 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  Text(
                    'This is the home screen of our navigation demo.',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 30 : 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context, 
                        '/second',
                        arguments: {'message': 'Hello from Home Screen!'},
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 10 : 12,
                        horizontal: isMobile ? 20 : 24,
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Go to Second Screen',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/widget-tree-demo');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 10 : 12,
                        horizontal: isMobile ? 20 : 24,
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      'Widget Tree Demo',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile-card-demo');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 10 : 12,
                        horizontal: isMobile ? 20 : 24,
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    child: Text(
                      'Profile Card Demo',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import '../services/firestore_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final firestore = FirestoreService();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(labelText: "Enter note"),
          ),
          ElevatedButton(
            onPressed: () {
              firestore.addData(textController.text);
              textController.clear();
            },
            child: const Text("Add"),
          ),
          Expanded(
            child: StreamBuilder(
              stream: firestore.readData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(docs[index]['text']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          firestore.deleteData(docs[index].id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
 main
