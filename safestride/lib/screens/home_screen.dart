import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final FirestoreService firestore = FirestoreService();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SafeStride Dashboard"),
        centerTitle: true,
      ),

      // ✅ LayoutBuilder for responsive switching
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileLayout(context);
          } else {
            return _buildTabletLayout(context);
          }
        },
      ),
    );
  }

  // ===============================
  // ✅ MOBILE LAYOUT
  // ===============================
  Widget _buildMobileLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            "Welcome Back 👋",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          Text(
            "Manage your notes and dashboard",
            style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
          ),

          SizedBox(height: screenHeight * 0.03),

          // Input Card
          _buildInputCard(screenWidth),

          SizedBox(height: screenHeight * 0.03),

          Text(
            "Your Notes",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // Notes List
          Expanded(child: _buildNotesList()),
        ],
      ),
    );
  }

  // ===============================
  // ✅ TABLET LAYOUT
  // ===============================
  Widget _buildTabletLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Row(
        children: [
          // Left Panel
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                _buildInputCard(screenWidth),
              ],
            ),
          ),

          const SizedBox(width: 30),

          // Right Panel
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Notes",
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(child: _buildNotesList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===============================
  // ✅ INPUT CARD (Reusable Section)
  // ===============================
  Widget _buildInputCard(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: "Enter a note...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                firestore.addData(textController.text);
                textController.clear();
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // ===============================
  // ✅ NOTES LIST
  // ===============================
  Widget _buildNotesList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: StreamBuilder(
        stream: firestore.readData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No notes yet"));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.note, color: Colors.blue),
                  title: Text(docs[index]['text']),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      firestore.deleteData(docs[index].id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
