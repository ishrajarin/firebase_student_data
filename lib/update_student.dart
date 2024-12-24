

import 'package:firebase_student_data/service/student_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/student.dart';



class UpdateNotes extends StatefulWidget {
  final Note? note;

  const UpdateNotes({super.key, this.note});

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {
  //declare controller
  var nameController = TextEditingController();
  var studentidController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var locationController = TextEditingController();

  //declare form key variable
  final GlobalKey<FormState> noteFormKey = GlobalKey();

  //declare services
  final NoteService noteService = NoteService();

  //for updating notes
  Future updateNote() async {
    final newNote = Note(
      id: widget.note!.id,
      name: nameController.text,
      studentid: studentidController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,

    );

    await noteService.updateNote(newNote);

    Get.back();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = widget.note!.name.toString();
    studentidController.text = widget.note!.studentid.toString();
    phoneController.text = widget.note!.phone.toString();
    emailController.text = widget.note!.email.toString();
    locationController.text = widget.note!.location.toString();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Update Student",
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
                  hintText: "Enter Name",
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
              const SizedBox(
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
              const SizedBox(
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
              //!--------------------------------
              const SizedBox(
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
              //!------------------------------------
              const SizedBox(
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
              ),//!------------------

              //!---------------------------------------------
              const SizedBox(
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
                onPressed: () async {
                  if (noteFormKey.currentState!.validate()) {
                    noteFormKey.currentState!.save();

                    updateNote();
                  }
                },
                child: const Text(
                  "Update Student",
                  style: TextStyle(
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