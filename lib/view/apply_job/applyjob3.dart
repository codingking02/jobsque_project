import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/connections/job_connection.dart';
import 'package:jobsque_amit_project/data/provider/applyjobprovider.dart';
import 'package:jobsque_amit_project/data/provider/job_provider.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class ApplyJob3 extends StatefulWidget {
  const ApplyJob3({super.key});

  @override
  State<ApplyJob3> createState() => _ApplyJob3State();
}

class _ApplyJob3State extends State<ApplyJob3> {
  bool istapped = false;

  JobConnection jobConnection = JobConnection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/arrow-left.svg',
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Text(
                        'Apply Job',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 20,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.20,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                SvgPicture.asset(
                  'assets/step3.svg',
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Upload Portfolio',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 1.20,
                    letterSpacing: 0.20,
                  ),
                ),
                Text(
                  'Fill in your bio data correctly',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                    letterSpacing: 0.14,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                textforapplyjobtextfield(
                  'Upload Cv',
                ),
                SizedBox(
                  height: 12,
                ),
                context.read<ApplyJobProvider>().pdffile == null ||
                        context.read<ApplyJobProvider>().pdffile!.path!.isEmpty
                    ? CircularProgressIndicator()
                    : InkWell(
                        onTap: () {
                          openPDF(context.read<ApplyJobProvider>().pdffile!);
                        },
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(
                                  0XFFD1D5DB,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                          ),
                          height: 81,
                          width: 1000,
                          padding: EdgeInsets.all(
                            16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getSvgPicture(
                                "assets/pdflogo.svg",
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 51,
                                width: 96,
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      context
                                          .read<ApplyJobProvider>()
                                          .pdffile!
                                          .name,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Color(0xFF111827),
                                        fontSize: 14,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'CV.pdf 300KB',
                                      style: TextStyle(
                                        color: Color(0xFF6B7280),
                                        fontSize: 12,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    getSvgPicture(
                                      "assets/edit.svg",
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          context
                                              .read<ApplyJobProvider>()
                                              .getpdffile(
                                                PlatformFile(
                                                  path: '',
                                                  name: '',
                                                  size: 0,
                                                ),
                                              );
                                        });
                                      },
                                      child: getSvgPicture(
                                        "assets/circlex.svg",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    pickAndUploadFiles(
                      context,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/otherfile.svg',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 1000,
                  height: 48,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              1000,
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(
                            51,
                            102,
                            255,
                            1,
                          ),
                        )),
                    onPressed: () async {
                      await jobConnection.applyjob(
                        platformFileToFile(
                          context.read<ApplyJobProvider>().pdffile!,
                        ),
                        platformFileToFile(
                          context.read<ApplyJobProvider>().pdffile!,
                        ),
                        context.read<ApplyJobProvider>().name,
                        context.read<ApplyJobProvider>().email,
                        context.read<ApplyJobProvider>().phonenumber,
                        context.read<ApplyJobProvider>().worktype,
                        context.read<JobProvider>().id,
                        context.read<JobProvider>().user_id,
                        context,
                      );
                    },
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.30,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getjobtype({
    required String text,
  }) {
    return InkWell(
      onTap: () {
        istapped = !istapped;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(
          16,
        ),
        height: 90,
        width: 1000,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(
                209,
                213,
                219,
                1,
              ),
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'CV.pdf . Portfolio.pdf',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.14,
                  ),
                ),
              ],
            ),
            istapped
                ? Image.asset(
                    'assets/bluecircle.png',
                  )
                : Image.asset(
                    'assets/circle.png',
                  ),
          ],
        ),
      ),
    );
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

    if (pdfFile != null) {
      context.read<ApplyJobProvider>().getpdffile(pdfFiles!);
      setState(() {});
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
