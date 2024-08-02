import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final RxString username = ''.obs; // Observable username

  final RxBool isButtonEnabled = false.obs;
  final RxString errorText = ''.obs;
  final RxBool isInputValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    String text = nameController.text;

    // Validate the input
    if (text.isEmpty) {
      errorText.value = '';
      isButtonEnabled.value = false;
      isInputValid.value = false;
    } else if (text.startsWith(' ')) {
      errorText.value = 'Leading spaces are not allowed.';
      isButtonEnabled.value = false;
      isInputValid.value = false;
    } else if (RegExp(r'[0-9]').hasMatch(text)) {
      errorText.value = 'Numbers are not allowed.';
      isButtonEnabled.value = false;
      isInputValid.value = false;
    } else if (RegExp(r'[^a-zA-Z\s]').hasMatch(text)) {
      errorText.value = 'Symbols are not allowed.';
      isButtonEnabled.value = false;
      isInputValid.value = false;
    } else {
      errorText.value = '';
      isButtonEnabled.value = true;
      isInputValid.value = true;
    }

    // Update the username when input is valid
    if (isInputValid.value) {
      username.value = text;
    }
  }

  void updateName(String newName) {
    // Update the username and text field
    username.value = newName;
    nameController.text = newName;
  }

  void validateInput() {
    _updateButtonState(); // Call the internal validation method
  }

  @override
  void dispose() {
    nameController.removeListener(_updateButtonState);
    nameController.dispose();
    super.dispose();
  }
}