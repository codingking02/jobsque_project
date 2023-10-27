// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Portfolio2 extends StatefulWidget {
  const Portfolio2({super.key});

  @override
  State<Portfolio2> createState() => _Portfolio2State();
}

class _Portfolio2State extends State<Portfolio2> {
  List<PlatformFile> pdflist = [];
  ProfileConnection profileConnection = ProfileConnection();
  @override
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
                getheader(text: 'Portfolio2', width: 110),
                SizedBox(
                  height: 36,
                ),
                InkWell(
                  onTap: () async {
                    pickAndUploadFiles(
                      context,
                    );
                  },
                  child: getSvgPicture(
                    'assets/addPortfolio2.svg',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pdflist.length,
              itemBuilder: (context, index) {
                final pdfFile = pdflist[index];
                return ListTile(
                  title: Text(pdfFile.name),
                  onTap: () {
                    openPDF(pdfFile);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);
    final buffer = byteData.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/logopdf.png');
    await tempFile.writeAsBytes(buffer);
    return tempFile;
  }

  File platformFileToFile(PlatformFile platformFile) {
    final uri = Uri.file(platformFile.path!);
    final file = File.fromUri(uri);
    return file;
  }

  void pickAndUploadFiles(BuildContext context) async {
    FilePickerResult? pdfFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    PlatformFile? pdfFiles = pdfFile?.files.first;

    File imageFile = await getImageFileFromAssets('assets/logopdf.png');
    if (pdfFile != null) {
      await profileConnection.uploadFilesToPostmanApi(
        platformFileToFile(pdfFiles!),
        imageFile,
        context,
      );
      pdflist.add(
        pdfFile.files.first,
      );
    }
  }

  Future<void> openPDF(PlatformFile pdfFile) async {
    if (pdfFile != null) {
      final filePath = pdfFile.path;
      final result = await OpenFile.open(filePath);
      if (result.type == ResultType.done) {
        print("File opened with success");
      } else {
        print("Could not open the file");
      }
    }
  }
}
