import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/nodes/embed.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/toolbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

class YrkQuillImageButton extends StatelessWidget {
  const YrkQuillImageButton({
    required this.controller,
    required this.imageSource,
    this.onImagePickCallback,
    this.imagePickImpl,
    required this.icon,
    this.width = 24.0,
    this.height = 24.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.color = const Color(0xff000000),
    Key? key,
  }) : super(key: key);


  final QuillController controller;

  final OnImagePickCallback? onImagePickCallback;

  final ImagePickImpl? imagePickImpl;

  final ImageSource imageSource;

  final String icon;
  final Color? color;
  final double width;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return YrkIconButton(
      icon: icon,
      width: width,
      height: height,
      padding: EdgeInsets.all(0),
      color: color,
      onTap: () => _handleImageButtonTap(context),
    );
  }

  Future<void> _handleImageButtonTap(BuildContext context) async {
    final index = controller.selection.baseOffset;
    final length = controller.selection.extentOffset - index;

    String? imageUrl;
    if (imagePickImpl != null) {
      imageUrl = await imagePickImpl!(imageSource);
    } else {
      if (kIsWeb) {
        imageUrl = await _pickImageWeb();
      } else if (Platform.isAndroid || Platform.isIOS) {
        imageUrl = await _pickImage(imageSource);
      } else {
        imageUrl = await _pickImageDesktop(context);
      }
    }

    if (imageUrl != null) {
      controller
          .replaceText(index, length, BlockEmbed.image(imageUrl), null);
    }
  }

  Future<String?> _pickImageWeb() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return null;
    }

    // Take first, because we don't allow picking multiple files.
    final fileName = result.files.first.name!;
    final file = File(fileName);

    return onImagePickCallback!(file);
  }

  Future<String?> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile == null) {
      return null;
    }

    return onImagePickCallback!(File(pickedFile.path));
  }

  Future<String?> _pickImageDesktop(BuildContext context) async {
    final filePath = await FilesystemPicker.open(
      context: context,
      rootDirectory: await getApplicationDocumentsDirectory(),
      fsType: FilesystemType.file,
      fileTileSelectMode: FileTileSelectMode.wholeTile,
    );
    if (filePath == null || filePath.isEmpty) return null;

    final file = File(filePath);
    return onImagePickCallback!(file);
  }
}
