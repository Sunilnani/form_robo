
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_robo/components/colors.dart';
import 'package:form_robo/components/theme_config.dart';



class AppDropDownSearch<T> extends StatelessWidget {
  final String ?title;
  final String ?hintText;
  final IconData? suffixIcon;
  final T ?selectedItem;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(T?)? validator;
  final Color? color;
  final Color? focusColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextEditingController ?controller;
  final bool ?enabled;
  final TextInputType ?textInputType;
  final bool ?obscureText;
  final DropdownSearchItemAsString<T> ?itemAsString;
  final DropdownSearchOnFind<T>?  asyncItems;
  final List<TextInputFormatter> ?inputFormatters;

  final ValueChanged<T?>? onChanged;

  const AppDropDownSearch({
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
    this.itemAsString,
    required this.asyncItems,
    this.onChanged,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title!=null)Text(
            title ?? "",
            style: TextStyle(
                color: color ?? ThemeConfig.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          if(title!=null) const SizedBox(
            height: 20,
          ),
          DropdownSearch<T>(
            selectedItem: selectedItem ?? null,
            validator: validator ?? null,
            showClearButton: true,

            clearButtonProps: IconButtonProps(
              icon: Icon(Icons.cancel),
            ),
            dropdownSearchDecoration:   InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                icon: Icon(suffixIcon,
                  color: color?? ThemeConfig.primaryColor,),
                onPressed: suffixIconOnTap ?? null,
              )
                  : null,
              suffixIconColor: color ?? ThemeConfig.primaryColor,
              border: InputBorder.none,
              hintText: hintText ?? title,
              hintStyle:TextStyle(fontSize: 14),
              filled: true,
              fillColor: fillColor ?? appTextFieldBgColor.withOpacity(0.2),
              errorBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color:Theme.of(context).errorColor)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Theme.of(context).errorColor)),
              enabledBorder: OutlineInputBorder(

                  borderSide: BorderSide(color: borderColor ?? Colors.transparent)),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusColor ?? appPrimaryColor)),
            ),
            itemAsString: itemAsString,
            // itemAsString: (Category category) => category!.categoryName,
            asyncItems  : asyncItems,
            // asyncItems: (String filter) async {
            //   // var response = await Dio().get(
            //   //   "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
            //   //   queryParameters: {"filter": filter},
            //   // );
            //   // var models = Category.fromJsonList(response.data);
            //   return categories;
            // },
            onChanged: onChanged,
          ),
          // TextFormField(
          //   obscureText: obscureText ?? false,
          //   inputFormatters: inputFormatters ?? [],
          //   keyboardType: textInputType ?? TextInputType.text,
          //   enabled: enabled ?? true,
          //   controller: controller,
          //   validator: validator,
          //   cursorColor: focusColor ?? appPrimaryColor,
          //   style: const TextStyle(fontSize: 14),
          //   decoration: InputDecoration(
          //     contentPadding:
          //     const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          //     suffixIcon: suffixIcon != null
          //         ? IconButton(
          //       icon: Icon(suffixIcon,
          //           color: color?? appPrimaryColor),
          //       onPressed: suffixIconOnTap ?? null,
          //     )
          //         : null,
          //     suffixIconColor: color ?? appPrimaryColor,
          //     border: InputBorder.none,
          //     hintText: hintText ?? title,
          //     filled: true,
          //     fillColor: fillColor ?? appTextFieldBgColor.withOpacity(0.2),
          //     errorBorder:  OutlineInputBorder(
          //         borderSide: BorderSide(color:Theme.of(context).errorColor)),
          //     disabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: borderColor ?? Colors.transparent)),
          //     focusedErrorBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color:Theme.of(context).errorColor)),
          //     enabledBorder: OutlineInputBorder(
          //
          //         borderSide: BorderSide(color: borderColor ?? Colors.transparent)),
          //
          //     focusedBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: focusColor ?? appPrimaryColor)),
          //   ),
          // ),
        ],
      ),
    );
  }
}

