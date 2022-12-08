import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_robo/components/theme_config.dart';


class ProfileTextFormField extends StatelessWidget {
  final String ?title;
  final String ?hintText;
  final IconData? suffixIcon;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? focusColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextEditingController ?controller;
  final bool ?enabled;
  final TextInputType ?textInputType;
  final bool ?obscureText;
  final Function(dynamic) ?onChanged;
  final List<TextInputFormatter> ?inputFormatters;
  final EdgeInsets? inputDecorationPadding;


  const ProfileTextFormField({
    Key? key,
    this.title,
    this.hintText,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.validator,
    this.color,
    this.focusColor,
    this.controller,
    this.enabled,
    this.textInputType,
    this.inputFormatters,
    this.borderColor,
    this.fillColor,
    this.obscureText,
    this.onChanged,
    this.inputDecorationPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child:  Align(
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(title!=null)Text(
              title ?? "",
              style: TextStyle(
                  color: color ?? ThemeConfig.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            if(title!=null) const SizedBox(
              width: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.5,

              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  color:  ThemeConfig.whiteColor,
                  border: Border.all(color:  ThemeConfig.bgGreyColor)
              ),
              child: TextFormField(
                onChanged: onChanged,
                obscureText: obscureText ?? false,
                inputFormatters: inputFormatters ?? [],
                keyboardType: textInputType ?? TextInputType.text,
                enabled: enabled ?? true,
                controller: controller,
                validator: validator,
                cursorColor: focusColor ??  ThemeConfig.primary,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding:
                  inputDecorationPadding ?? EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  suffixIcon: suffixIcon != null
                      ? IconButton(
                    icon: Icon(suffixIcon,
                      color: color??  ThemeConfig.primary,),
                    onPressed: suffixIconOnTap ?? null,
                  )
                      : null,
                  suffixIconColor: color ??  ThemeConfig.primary,
                  border: InputBorder.none,
                  hintText: hintText ?? title,
                  filled: true,
                  fillColor: fillColor ??  ThemeConfig.greyLight,
                  errorBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color:Theme.of(context).errorColor)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor ?? Colors.transparent)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Theme.of(context).errorColor)),
                  enabledBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: borderColor ?? Colors.transparent)),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: focusColor ??  ThemeConfig.primary,)),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
