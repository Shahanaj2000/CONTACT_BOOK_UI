import 'package:contact_book_ui/model/contact_model.dart';
import 'package:get/get.dart';


class AppData extends GetxController {


  var contacts = [].obs;

  addContact(ContactModel contact) {
    contacts.add(contact);
    Get.back();
  }

  deleteContact(ContactModel contact) {
    contacts.remove(contact);
  }

}
