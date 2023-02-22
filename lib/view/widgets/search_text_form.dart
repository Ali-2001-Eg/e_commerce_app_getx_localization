import 'package:flutter/material.dart';
class SearchTextForm extends StatelessWidget {
  const SearchTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(Icons.search,color: Colors.grey,),
        hintText: 'Search you\'re looking for',
        hintStyle: const TextStyle(color: Colors.black45,fontSize: 12,fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      //line color
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,

    );
  }
}
