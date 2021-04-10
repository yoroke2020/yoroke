import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'YrkTextStyle.dart';

const BorderRadius borderRadius = const BorderRadius.all(Radius.circular(100));

class YrkTextFieldInputDecoration extends InputDecoration {
  final bool filled;
  final String hintText;
  final String errorText;

  const YrkTextFieldInputDecoration({
    this.filled,
    this.hintText,
    this.errorText,
  }) : super(
          contentPadding: const EdgeInsets.only(
            left: 16,
            top: 12,
            bottom: 12,
          ),
          filled: true,
          fillColor: const Color(0xfff0f0f0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0x4d000000),
              width: 1,
            ),
            borderRadius: borderRadius,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xe6000000),
              width: 1,
            ),
            borderRadius: borderRadius,
          ),
          hintStyle: const YrkTextStyle(
            color: Color(0x4d000000),
            fontSize: 16,
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // hintText: labelText,
          // errorText: errorText,
        );
}

class YrkTextField extends TextField {
  final bool obscureText;
  final String label;
  final String errorText;

  final double width;
  final double height;

  YrkTextField({
    this.obscureText = false,
    this.label,
    this.errorText,
    this.height,
    this.width,
  }) : super(
          obscureText: obscureText,
          decoration: YrkTextFieldInputDecoration(
              hintText: label, errorText: errorText),
        );
}
// TextField(Decoration: InputDecorator())
// class YrkTextField extends StatefulWidget {
//   final double width;
//   final double height;
//   final String label;
//   final String errorText;
//   final bool obscureText;

//   String data;

//   final double fontSize;

//   final TextEditingController txtController = TextEditingController();

//   YrkTextField({
//     Key key,
//     @required this.label,
//     this.obscureText = false,
//     this.width = double.infinity,
//     this.height = double.infinity,
//     this.fontSize = 16,
//     this.errorText = "Error message",
//     this.data,
//   }) : super(key: key);

//   @override
//   _YrkTextFieldState createState() => _YrkTextFieldState();
// }

// class _YrkTextFieldState extends State<YrkTextField> {
//   InputDecoration YrkTxtFieldInputDecoration(String label, String errorText) {
//     return InputDecoration(
//       contentPadding: EdgeInsets.all((widget.height - widget.fontSize) * 0.5),
//       filled: true,
//       fillColor: const Color(0xfff0f0f0),
//       border: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: const Color(0x4d000000),
//           width: 1,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(36),
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: const Color(0xe6000000),
//           width: 1,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(36),
//         ),
//       ),
//       hintStyle: YrkTextStyle(
//         color: Color(0x4d000000),
//         fontSize: 16,
//       ),
//       hintText: label,
//       errorText: errorText,
//     );
//   }

//   void _handleSubmitted(String text) {
//     widget.txtController.clear();
//   }

//   String data;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(0),
//       alignment: AlignmentDirectional.center,
//       child: Container(
//         width: widget.width,
//         height: widget.height,
//         child: TextField(
//           // controller: widget.txtController,
//           onSubmitted: (String str) {
//             setState(() {
//               data = str;
//               widget.data = data;
//             });
//           },
//           // scrollPadding: EdgeInsets.only(bottom:bottomInsets + 40.0),
//           decoration:
//               YrkTxtFieldInputDecoration(widget.label, widget.errorText),
//           obscureText: widget.obscureText,
//           // vali
//         ),
//       ),
//     );
//   }
// }
