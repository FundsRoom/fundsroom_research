import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/contact_us.dart';
import '../controller/contact_us_controller.dart';

class ContactUpForm extends StatefulWidget {
  const ContactUpForm({super.key});

  @override
  State<ContactUpForm> createState() => _ContactUpFormState();
}

class _ContactUpFormState extends State<ContactUpForm> {
  final controller = ContactUsController();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final phone = _phoneController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      final contactUs = ContactUs(
          name: name,
          phone: phone,
          email: email,
          message: message,
          date: DateTime.now(),
          type: "research");
      try {
        await controller.submit(contactUs);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message sent, Thank you!")),
        );
      } on Exception catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SizedBox(
            width: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Contact Us",
                  style: GoogleFonts.merriweatherSans(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Drop you message and our team will contact you as soon as possible. Thank you!",
                  style: GoogleFonts.inter(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: controller.validateName,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: controller.validatePhone,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: controller.validateEmail,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            labelText: "Message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          maxLines: 5,
                          validator: controller.validateMessage,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => submit(),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Submit",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //
      );
}
