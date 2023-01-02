import 'package:contact_book_ui/controller/app_data.dart';
import 'package:contact_book_ui/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactScreen extends StatelessWidget {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  AppData appData = Get.find<AppData>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children:  [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name'
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            

            TextField(
              keyboardType: TextInputType.phone,
              controller: _numberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your mobile'
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email'
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            MaterialButton(
              onPressed: () {
                ContactModel model = ContactModel(
                  name: _nameController.text,
                  email: _emailController.text,
                  mobileNo: _numberController.text,
                );

                appData.addContact(model);
              },
              child: Text(
                "Add",
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}