import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';

import 'YrkMobileImageGrids.dart';

class YrkImagePicker extends StatelessWidget {
  const YrkImagePicker({
    this.onImagePickCallback,
    required this.icon,
    this.numPicks = 10,
    Key? key,
  }) : super(key: key);

  final Future<void> Function(List<File> imageFiles)? onImagePickCallback;
  final Widget icon;
  final int numPicks;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        child: icon,
        onTap: () => _handleImageButtonTap(context),
      ),
    );
  }

  Future<void> _handleImageButtonTap(BuildContext context) async {
    List<File>? imageFiles = [];
    if (kIsWeb) {
      imageFiles.add((await _pickImageWeb())!);
    } else if (Platform.isAndroid || Platform.isIOS) {
      imageFiles = await _pickImage(context);
    } else {
      imageFiles.add((await _pickImageDesktop(context))!);
    }

    onImagePickCallback!(imageFiles as List<File>);
  }

  Future<File?> _pickImageWeb() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return null;
    }

    final fileName = result.files.first.name!;
    final file = File(fileName);

    return _onImagePickCallback(file);
  }

  Future<List<File>?> _pickImage(BuildContext context) async {
    final pickedFiles = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => YrkMobileImageGrids(numPicks: numPicks)));
    if (pickedFiles == null) return null;

    List<File> files = pickedFiles as List<File>;
    List<File> imageFiles = [];
    for (int i = 0; i < files.length; i++)
      imageFiles.add(await _onImagePickCallback(File(files[i].path)));
    return imageFiles;
  }

  Future<File?> _pickImageDesktop(BuildContext context) async {
    final filePath = await FilesystemPicker.open(
      context: context,
      rootDirectory: await getApplicationDocumentsDirectory(),
      fsType: FilesystemType.file,
      fileTileSelectMode: FileTileSelectMode.wholeTile,
    );
    if (filePath == null || filePath.isEmpty) return null;

    final file = File(filePath);
    return _onImagePickCallback(file);
  }

  Future<File> _onImagePickCallback(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');
    return copiedFile;
  }
}
