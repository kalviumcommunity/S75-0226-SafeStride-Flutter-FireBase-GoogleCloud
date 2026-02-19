import 'package:flutter/material.dart';
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
