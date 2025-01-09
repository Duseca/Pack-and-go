import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_fonts.dart';
import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.hint,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 15.0,
    this.maxLines,
    this.isFilled = true,
    this.filledColor,
    this.focusedFilledColor,
    this.fhintColor,
    this.hintColor,
    this.bordercolor,
    this.isright,
    this.radius = 10,
    this.haveLabel = true,
    this.labelSize,
    this.prefixIcon,
    this.suffixtext,
    this.suffixIcon,
    this.suffixTap,
    this.keyboardType,
    this.showFlag,
    this.labelColor,
    this.labelWeight,
    this.validator,
    this.textColor,
    this.isoptional = false,
    this.fbordercolor,
    this.focusedLabelColor,
    this.useCountryCodePicker = false,
    this.useOutlinedBorder =
        true, // true for outlined border, false for underline
  }) : super(key: key);
  String? label, hint, suffixtext;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure,
      isoptional,
      haveLabel,
      isFilled,
      isright,
      useCountryCodePicker,
      showFlag,
      useOutlinedBorder; // Added this flag for choosing border style
  double? marginBottom;
  int? maxLines;
  double? labelSize, radius;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Color? filledColor,
      focusedFilledColor,
      focusedLabelColor,
      hintColor,
      bordercolor,
      fbordercolor,
      fhintColor,
      textColor,
      labelColor;
  FontWeight? labelWeight;
  TextInputType? keyboardType;
  VoidCallback? suffixTap;
  String? Function(String?)? validator;
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode _focusNode;
  final ValueNotifier<bool> _focusNotifier = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _focusNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    _focusNotifier.value = _focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [MoveEffect()],
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.marginBottom!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.label != null)
              ValueListenableBuilder(
                valueListenable: _focusNotifier,
                builder: (_, isFocused, child) {
                  return Row(
                    children: [
                      MyText(
                        text: widget.label ?? '',
                        size: widget.labelSize ?? 14,
                        paddingBottom: 8,
                        weight: widget.labelWeight ?? FontWeight.w400,
                        color: isFocused
                            ? widget.focusedLabelColor ?? kBlack2Color
                            : widget.labelColor ?? kSecondaryColor,
                      ),
                      if (widget.isoptional == true)
                        MyText(
                          text: ' (optional)',
                          size: 12,
                          color: ksubtextColor,
                          paddingBottom: 8,
                        )
                    ],
                  );
                },
              ),
            // if (widget.label != null)
            //   MyText(
            //     text: widget.label ?? '',
            //     size: 14,
            //     paddingBottom: 8,
            //     weight: widget.labelWeight ?? FontWeight.w500,
            //     color: widget.labelColor ?? kGreyColor,
            //   ),
            ValueListenableBuilder(
              valueListenable: _focusNotifier,
              builder: (_, isFocused, child) {
                return TextFormField(
                  cursorColor: kBlack2Color,
                  keyboardType: widget.keyboardType,
                  maxLines: widget.maxLines ?? 1,
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  textInputAction: TextInputAction.next,
                  obscureText: widget.isObSecure!,
                  obscuringCharacter: '*',
                  style: TextStyle(
                    fontFamily: AppFonts.URBANIST,
                    fontSize: 15,
                    color: widget.textColor ?? kBlack2Color,
                    fontWeight: FontWeight.w400,
                  ),
                  validator: widget.validator,
                  textAlign:
                      widget.isright == true ? TextAlign.right : TextAlign.left,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    prefixIcon:
                        widget.prefixIcon != null ? widget.prefixIcon : null,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    hintText: widget.hint,
                    suffixIcon: widget.suffixIcon != null
                        ? GestureDetector(
                            onTap: widget.suffixTap,
                            child: widget.suffixIcon,
                          )
                        : widget.suffixIcon,
                    suffixStyle: TextStyle(
                      fontFamily: AppFonts.URBANIST,
                      fontSize: 14,
                      color: isFocused ? widget.fhintColor : widget.hintColor,
                    ),
                    suffixText: widget.suffixtext,
                    hintStyle: TextStyle(
                      fontFamily: AppFonts.URBANIST,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: isFocused
                          ? widget.fhintColor ?? kBlack2Color.withOpacity(0.5)
                          : widget.hintColor ?? kBlack2Color.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: isFocused
                        ? widget.focusedFilledColor ??
                            kSecondaryColor.withOpacity(0.03)
                        : widget.filledColor ?? kPrimaryColor,
                    // Conditional Borders based on user choice
                    enabledBorder: widget.useOutlinedBorder == true
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.bordercolor ?? kGrey1Color,
                                width: 1),
                            borderRadius:
                                BorderRadius.circular(widget.radius ?? 10),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.bordercolor ?? kPrimaryColor,
                                width: 1),
                          ),
                    focusedBorder: widget.useOutlinedBorder == true
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.fbordercolor ?? kSecondaryColor,
                                width: 1.5),
                            borderRadius:
                                BorderRadius.circular(widget.radius ?? 10),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.bordercolor ??
                                    kPrimaryColor.withOpacity(0.3),
                                width: 1.5),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
