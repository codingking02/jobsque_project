import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  List<Map<String, dynamic>>? portfolioData;
  List<PlatformFile> pdflist = [];
  ProfileConnection profileConnection = ProfileConnection();
  @override
  void initState() {
    super.initState();
    profileConnection.fetchDataFromPostmanAPI(context).then((data) {
      setState(() {
        portfolioData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          profileConnection.fetchDataFromPostmanAPI(context).then((data) {
            setState(() {
              portfolioData = data;
            });
          });
        },
        child: Icon(
          Icons.refresh,
        ),
      ),
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
                  onTap: () async {
                    pickAndUploadFiles(
                      context,
                    );
                    profileConnection
                        .fetchDataFromPostmanAPI(context)
                        .then((data) {
                      setState(() {
                        portfolioData = data;
                      });
                    });
                  },
                  child: getSvgPicture(
                    'assets/addportfolio.svg',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          portfolioData == null
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: portfolioData!.length,
                    itemBuilder: (context, index) {
                      final item = portfolioData![index];
                      return ListTile(
                        title: Text(item['cv_file']),
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
}
