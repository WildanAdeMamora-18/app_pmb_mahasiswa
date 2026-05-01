import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageField extends StatefulWidget {
  final String title;
  final Function(File?) onImageSelected;

  const UploadImageField({
    super.key,
    required this.title,
    required this.onImageSelected,
  });

  @override
  State<UploadImageField> createState() => _UploadImageFieldState();
}

class _UploadImageFieldState extends State<UploadImageField> {
  File? imageFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // bisa ganti camera
      imageQuality: 70,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });

      widget.onImageSelected(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),

          GestureDetector(
            onTap: pickImage,
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: imageFile == null
                  ? Center(child: Text("Pilih Gambar"))
                  : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}