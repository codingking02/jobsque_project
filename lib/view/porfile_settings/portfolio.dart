import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  List<File> pdfFiles = [];

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      File pickedFile = File(file.path!);

      setState(() {
        pdfFiles.add(pickedFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gettopbarimage(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                getheader(text: 'Portfolio', width: 110),
                SizedBox(
                  height: 36,
                ),
                InkWell(
                  onTap: _pickPDF,
                  child: getSvgPicture(
                    'assets/addportfolio.svg',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pdfFiles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(pdfFiles[index].path.split('/').last),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
