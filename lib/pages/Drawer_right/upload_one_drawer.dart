import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UploadDataQA extends StatefulWidget {
  const UploadDataQA({super.key});

  @override
  State<UploadDataQA> createState() => _UploadDataQAState();
}

class _UploadDataQAState extends State<UploadDataQA> {
  File? _image;
  String? name;
  String Station = 'WQ 1';
  List<String> _items = ['WQ 1', 'Bhitarkanika Nation Park'];

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        name = _image!.path.split('/').last; // Get only the file name
      } else {
        // User canceled the picker
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.3,
              child: ListView(
                children: [
                  ListTile(
                      title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('File Upload'),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Drop('Station', Station, _items, (p0) {
                    setState(() {
                      Station = p0!;
                    });
                  }),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select file'),
                      Container(
                        height: 50,
                        // width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: _getImage,
                              child: Container(
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: const Center(
                                  child: Text('Choose file'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(_image != null
                                  ? name.toString()
                                  : 'No file chosen'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 70,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blue, strokeAlign: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.ubuntu(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          'Upload',
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget Drop(
    String title,
    String? selectedValue,
    List<String> list,
    void Function(String?)? onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
          isExpanded: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            ),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ],
    );
  }
}
