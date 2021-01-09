import 'package:flutter/material.dart';

class ContactTextField extends StatelessWidget {
  final String label, hint;
  final Function saveTo;
  final TextEditingController textEditingController;
  final bool specialCharactersNotAllowed,
      isEmpty,
      stringsNotAllowed,
      digitsNotAllowed,
      spaceNotAllowed;
  final int length;
  ContactTextField(
      {this.label,
      this.hint,
      this.saveTo,
      this.textEditingController,
      this.specialCharactersNotAllowed,
      this.isEmpty,
      this.length,
      this.stringsNotAllowed,
      this.digitsNotAllowed,
      this.spaceNotAllowed});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      scrollPadding: EdgeInsets.all(12),
      //autofocus: true,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value.trim().length > length) {
          return "Value too long";
        } else if (value.isEmpty && isEmpty) {
          return "Value cannot be empty";
        } else if (value.contains(new RegExp(r'(\d+)')) && digitsNotAllowed) {
          return "No digits allowed";
        } else if (value.contains(new RegExp(r'([A-Z]|[a-z])')) &&
            stringsNotAllowed) {
          return "No strings allowed";
        } else if (value.contains(new RegExp(
                r'(~|`|!|@|#|\$|%|\^|&|\*|\(|\)|-|_|\+|=|{|}|\[|\]|\||\\|:|;|"|<|,|>|\.|\?|/)')) &&
            specialCharactersNotAllowed) {
          return "No special characters allowed";
        } else if (value.contains(new RegExp(r'  ')) && spaceNotAllowed) {
          return "Too much space";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        saveTo(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: "SourceSans",
          fontSize: 20,
        ),
        hintText: hint,
      ),
    );
  }
}
