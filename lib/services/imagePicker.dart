import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Image_Picker{
  Future<File> uploadImage(String inputSource) async {
    final picker = ImagePicker();
    final XFile? pickerImage = await picker.pickImage(
      source: inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery
    );
    File imageFile = File(pickerImage!.path);
    return imageFile;
  }
}