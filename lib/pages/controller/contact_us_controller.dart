import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/contact_us.dart';

class ContactUsController {


  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!value.contains("@")) {
      return "Email is invalid";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone is required";
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return "Message is required";
    }
    return null;
  }

  Future<void> submit(ContactUs contactUs) async {
    final firebase = FirebaseFirestore.instance;
    final collection = firebase.collection("contact_us");
    await collection.add(contactUs.toMap());
    
  }
}
