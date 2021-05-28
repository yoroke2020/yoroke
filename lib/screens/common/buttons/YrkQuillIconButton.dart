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
import 'package:yoroke/screens/post/PostCreateImageUpload.dart';

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
    List<String>? imageUrls;
    if (imagePickImpl != null) {
      imageUrl = await imagePickImpl!(imageSource);
    } else {
      if (kIsWeb) {
        imageUrl = await _pickImageWeb();
      } else if (Platform.isAndroid || Platform.isIOS) {
        imageUrls = await _pickImage(context, imageSource);
      } else {
        imageUrl = await _pickImageDesktop(context);
      }
    }

    if ((Platform.isAndroid || Platform.isIOS) && imageUrls != null) {
      for (int i = imageUrls.length - 1; i >= 0; i--) {
        controller.replaceText(
            index, length, BlockEmbed.image(imageUrls[i]), null);
      }
    } else {
      if (imageUrl != null) {
        controller.replaceText(index, length, BlockEmbed.image(imageUrl), null);
      }
    }
  }

  Future<String?> _pickImageWeb() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return null;
    }

    final fileName = result.files.first.name!;
    final file = File(fileName);

    return onImagePickCallback!(file);
  }

  Future<List<String>?> _pickImage(
      BuildContext context, ImageSource source) async {
    final pickedFiles = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => PostCreateImageUpload()));
    if (pickedFiles == null) return null;

    List<File> files = pickedFiles as List<File>;
    List<String> imageUrls = [];
    if (files[0].path == "camera") {
      final cameraFile =
          await ImagePicker().getImage(source: ImageSource.camera);
      imageUrls.add(await onImagePickCallback!(File(cameraFile!.path)));
    } else {
      for (int i = 0; i < files.length; i++)
        imageUrls.add(await onImagePickCallback!(File(files[i].path)));
    }
    return imageUrls;
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
