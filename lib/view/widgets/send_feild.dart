import 'package:flutter/material.dart';
import 'package:pack_and_go/constants/app_colors.dart';
import 'package:pack_and_go/constants/app_sizes.dart';
import 'package:pack_and_go/generated/assets.dart';

class SendField extends StatelessWidget {
  SendField({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onTap,
    this.validator,
    this.onPickImage,
    this.onAdd,
    this.onSendTap,
  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onAdd, onPickImage, onSendTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor2,
      child: Padding(
        padding: AppSizes.DEFAULT,
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: kBlackColor,
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller,
                  onTap: onTap,
                  onChanged: onChanged,
                  validator: validator,
                  autovalidateMode: AutovalidateMode.always,
                  cursorWidth: 1.0,
                  style: TextStyle(
                    fontSize: 12,
                    color: kBlackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kGrey1Color,
                    hintText: 'Send a message...',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: kGrey5Color,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onPickImage,
                          child: Image.asset(
                            Assets.imagesCopy,
                            height: 18,
                          ),
                        ),
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 0.82,
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 0.82,
                        color: kGrey5Color,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: onSendTap,
                child: Image.asset(
                  Assets.imagesSend,
                  height: 48,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
