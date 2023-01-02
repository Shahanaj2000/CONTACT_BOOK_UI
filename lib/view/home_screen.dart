import 'package:contact_book_ui/controller/app_data.dart';
import 'package:contact_book_ui/model/contact_model.dart';
import 'package:contact_book_ui/view/add_contact_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   //HomeScreen({super.key});

  AppData appData = Get.put(AppData(), permanent: true); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              itemBuilder: (ctx, index) {
                ContactModel model = appData.contacts.value[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(model.name),
                    subtitle: Text(model.mobileNo),
                    trailing: IconButton(
                      onPressed: () {
                        appData.deleteContact(model);
                      },
                      icon: Icon(Icons.delete, color: Colors.red,),
                    ),
                  ),
                );
              },
              itemCount: appData.contacts.value.length,
            ))
            
          ),

          MaterialButton(
            onPressed: () {
              Get.to(() =>  AddContactScreen());
            },
            child: Text(
              "Add Contact",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            color: Colors.blue,
          ),
        ],
      ),

    );
  }
}