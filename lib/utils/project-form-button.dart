import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProjectFormField extends StatefulWidget {
  final String label;
  final Icon? suffixIcon;
  final String formControlName;
  final bool obscureText;
  final double? elevation;
  final bool? insideLabel;
  final TextInputType? keyBoardType;
  final double? shape;
  final List<TextInputFormatter>? inputFormatters;

  const ProjectFormField({
    Key? key,
    required this.formControlName,
    this.keyBoardType,
    required this.label,
    this.suffixIcon,
    required this.obscureText,
    this.elevation,
    this.insideLabel,
    this.inputFormatters,
    this.shape,
  }) : super(key: key);

  @override
  _ProjectFormFieldState createState() => _ProjectFormFieldState();
}

class _ProjectFormFieldState extends State<ProjectFormField> {
  bool _passwordVisibility = false;

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordVisibility = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.insideLabel == false || widget.insideLabel == null
            ? Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            widget.label,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.50),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        )
            : Container(),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.shape ?? 0)),
          elevation: widget.elevation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: ReactiveTextField(
                    keyboardType: widget.keyBoardType,
                    formControlName: widget.formControlName,
                    validationMessages: (control) => {
                      ValidationMessage.required: 'Required',
                      ValidationMessage.email: '',
                      ValidationMessage.maxLength:  '',
                    },
                    inputFormatters: widget.inputFormatters,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                    ),
                    obscureText: _passwordVisibility,
                    decoration: InputDecoration(
                      hintText: widget.insideLabel == true ? widget.label : null,
                      border: InputBorder.none,
                      suffixIcon: !widget.obscureText
                          ? widget.suffixIcon
                          : IconButton(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        icon: Icon(_passwordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => togglePasswordVisibility(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
