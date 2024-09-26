import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';

class PermitPage extends StatefulWidget {
  const PermitPage({super.key});

  @override
  State<PermitPage> createState() => _PermitPageState();
}

class _PermitPageState extends State<PermitPage> {
  String? imagePath;
  final TextEditingController dateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        imagePath = pickedFile.path;
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  void _submitPermit() {
    final String date = dateController.text;
    final String reason = reasonController.text;

    if (date.isEmpty || reason.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tanggal dan alasan tidak boleh kosong!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Logic untuk menyimpan atau mengirim data izin
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Permintaan izin berhasil dikirim!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Izin'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: [
          // Date Picker for selecting the date
          CustomDatePicker(
            label: 'Tanggal',
            onDateSelected: (selectedDate) =>
                dateController.text = selectedDate.toString(),
          ),
          const SpaceHeight(16.0),

          // Text Field for reason
          CustomTextField(
            controller: reasonController,
            label: 'Keperluan',
            maxLines: 5,
          ),
          const SpaceHeight(26.0),

          // Image picker for adding attachments
          Padding(
            padding: EdgeInsets.only(right: context.deviceWidth / 2),
            child: GestureDetector(
              onTap: _pickImage,
              child: imagePath == null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      color: Colors.grey,
                      radius: const Radius.circular(18.0),
                      dashPattern: const [8, 4],
                      child: Center(
                        child: SizedBox(
                          height: 120.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.image.svg(),
                              const SpaceHeight(18.0),
                              const Text('Lampiran'),
                            ],
                          ),
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      child: Image.file(
                        File(imagePath!),
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          const SpaceHeight(65.0),

          // Submit Button
          Button.filled(
            onPressed: _submitPermit,
            label: 'Kirim Permintaan',
          ),
        ],
      ),
    );
  }
}
