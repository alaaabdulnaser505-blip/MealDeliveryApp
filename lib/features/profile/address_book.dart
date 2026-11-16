import 'package:flutter/material.dart';
import 'package:tripora/features/profile/widgets/custom_eleveted_button.dart';
import 'package:tripora/features/profile/widgets/custom_text_form_field.dart';

class AddressBook extends StatelessWidget {
  AddressBook({super.key});
  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Address Book', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                lable: ' Address Line 1',
                hintText: 'Enter your address',
                controller: nameController,
              ),
              CustomTextFormField(
                lable: 'Address Line 2',
                hintText: 'Enter your address',
                controller: nameController,
              ),
              CustomTextFormField(
                lable: 'City',
                hintText: 'City',
                controller: nameController,
              ),
              CustomTextFormField(
                lable: 'State',
                hintText: 'State',
                controller: nameController,
              ),
              CustomTextFormField(
                lable: 'Pincode',
                hintText: 'Pincode',
                controller: nameController,
              ),
              const Spacer(),
              CustomElevatedButton(
                text: 'Save This Address',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Handle save action
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
