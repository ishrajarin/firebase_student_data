

import 'package:firebase_student_data/service/student_service.dart';
import 'package:firebase_student_data/service/student_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/student.dart';


class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  //declare controller
  var nameController = TextEditingController();
  var studentidController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var locationController = TextEditingController();


  //form key variable
  final GlobalKey<FormState> noteFormKey = GlobalKey();

  //service variable
  final NoteService noteService = NoteService();

  //function to add notes
  Future addNote() async {

    final newNote = Note(
      name: nameController.text,
      studentid: studentidController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    await noteService.addNote(newNote);



    Get.back();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          "Add Student",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: noteFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter name",
                  prefixIcon: const Icon(Icons.note_alt_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter name";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: studentidController,
                //maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Student ID",
                  hintText: "Enter ID",
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter ID";
                  }else if (value.length > 7) {
                    return "Student ID must be no more than 7 characters";
                  }

                  return null;
                },
              ),
              //!----------------------------------
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                //maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Enter Phone Number",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone number";
                  }else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                    return "Phone number must be exactly 11 digits.";
                  }

                  return null;
                },
              ),
              //!-------------------------
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                //maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "example@email.com",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                    return "Enter a valid email address";
                  }

                  return null;
                },
              ),
              //!--------------------
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: locationController,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Location",
                  hintText: "Enter Location",
                  prefixIcon: const Icon(Icons.notes),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter location";
                  }

                  return null;
                },
              ),
              //!-------------------------
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: ()  {
                  if (noteFormKey.currentState!.validate()) {
                    noteFormKey.currentState!.save();

                    // add note function call here
                    addNote();


                  }
                },
                child: Text(
                  "Save Student",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}