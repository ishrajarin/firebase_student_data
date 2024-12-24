import 'package:firebase_student_data/service/student_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'add_student.dart';
import 'model/student.dart';
import 'update_student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteService noteService = NoteService();

  // Function to launch the phone call
  _makingPhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber); // Create a tel URI
    if (await canLaunchUrl(url)) {
      await launchUrl(url); // Launch the phone dialer
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Students Info App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<List<Note>>(
        stream: noteService.getNotes(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(
                    note.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(note.studentid),
                  leading: const Icon(
                    Icons.note_alt_outlined,
                    size: 40,
                  ),
                  onTap: () {
                    Get.to(UpdateNotes(note: note));
                  },
                  trailing: SizedBox(
                    width: 100, // Set a fixed width for trailing section
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            _makingPhoneCall(note.phone); // Trigger call
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            noteService.deleteNote(note.id!);
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(const AddNotes());
        },

      ),
    );
  }
}