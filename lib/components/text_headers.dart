import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_robo/components/theme_config.dart';







class AppTextHint extends StatelessWidget {
  final String text;
  final EdgeInsets ?padding;
  const AppTextHint(this.text, {Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding?? const EdgeInsets.symmetric(vertical: 12),
      child: Text(text, style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 12,
          color: ThemeConfig.blackColor.withOpacity(0.8),
          fontWeight: FontWeight.w400)),
    );
  }
}

class AppButtonText extends StatelessWidget {
  final String title;
  final Color ?color;
  const AppButtonText(this.title, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: color ?? ThemeConfig.whiteColor,
          ),
          textAlign: TextAlign.center,
        ));
  }
}



