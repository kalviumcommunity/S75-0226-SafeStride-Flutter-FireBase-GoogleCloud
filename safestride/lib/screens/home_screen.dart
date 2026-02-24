import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final FirestoreService firestore = FirestoreService();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    return Scaffold(

      appBar: AppBar(
        title: const Text("SafeStride Dashboard"),
        centerTitle: true,
      ),

      body: Center(

        child: Container(

          constraints: BoxConstraints(
            maxWidth: isDesktop
                ? 900
                : isTablet
                    ? 700
                    : double.infinity,
          ),

          padding: EdgeInsets.all(isMobile ? 16 : 24),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // HEADER
              Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: isMobile ? 22 : 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Manage your notes and dashboard",
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 24),

              // INPUT CARD
              Container(
                padding: const EdgeInsets.all(16),

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
              ),

              const SizedBox(height: 24),

              // NOTES HEADER
              Text(
                "Your Notes",
                style: TextStyle(
                  fontSize: isMobile ? 18 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // NOTES LIST
              Expanded(
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: StreamBuilder(

                    stream: firestore.readData(),

                    builder: (context, snapshot) {

                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (!snapshot.hasData ||
                          snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text("No notes yet"),
                        );
                      }

                      final docs = snapshot.data!.docs;

                      return ListView.builder(

                        padding: const EdgeInsets.all(8),

                        itemCount: docs.length,

                        itemBuilder: (context, index) {

                          return Card(

                            child: ListTile(

                              title: Text(
                                docs[index]['text'],
                              ),

                              leading: const Icon(
                                Icons.note,
                                color: Colors.blue,
                              ),

                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),

                                onPressed: () {
                                  firestore.deleteData(
                                    docs[index].id,
                                  );
                                },
                              ),

                            ),
                          );

                        },

                      );

                    },

                  ),

                ),
              ),

            ],

          ),

        ),

      ),

    );

  }

}