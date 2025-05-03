import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';

class Userinput extends StatefulWidget {
  const Userinput({
    super.key,
    this.hintText,
    required this.controller,
    this.validator,
    this.textInputType,
    this.obscure = false,
    required this.prefixIcon,
  });


  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final TextInputType? textInputType;
  final bool obscure;
  final Icon prefixIcon;

  @override
  State<Userinput> createState() => _UserinputState();
}

class _UserinputState extends State<Userinput> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProviders>(context).isDarkMode;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: widget.textInputType,
            controller: widget.controller,
            cursorHeight: 15,
            cursorColor: isDarkMode ? Colors.white : Colors.black,
            obscureText: widget.obscure ? _isObscured : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.7),
                fontSize: 11
              ),
              prefixIcon: Container(
                margin: EdgeInsets.only(right: 5,bottom: 0),
                height: 55,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.teal.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: widget.prefixIcon,
                ),
              ),
              suffixIcon: widget.obscure
                  ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.teal.shade900,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.teal.shade900),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.teal.shade900),
              ),
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
