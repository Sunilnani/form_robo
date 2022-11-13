import 'package:flutter/material.dart';
import 'package:form_robo/components/theme_config.dart';



class AppCustomCard extends StatelessWidget {

  final Widget child;
  final String ?title;
  final Color? color;
  final Color? borderColor;
  final Color? titleColor;
  final EdgeInsets ?marign;
  final EdgeInsets ?padding;
  final double ?elivation;
  final double ?spreadRadius;
  const AppCustomCard({Key? key, required this.child, this.title, this.borderColor,this.titleColor, this.marign, this.padding,this.color, this.elivation, this.spreadRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marign ?? const EdgeInsets.only(bottom: 10,top: 10),
      padding: padding?? const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(6),
      decoration: ThemeConfig.boxDecorationWithRoundBorder(
          context,
          border: Border.all(color: borderColor?? Colors.transparent,width: 2),
          elivation: elivation,
          spreadRadius: spreadRadius,
          color: color ?? ThemeConfig.whiteColor),
      child: title==null? child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("$title", style: ThemeConfig.textStyleTitle(context)!.copyWith(color: titleColor?? Theme.of(context).primaryColor.withOpacity(0.8)),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Divider(color: Theme.of(context).primaryColor.withOpacity(0.8),),
          ),
          child,
        ],
      ),);
  }
}


class AppCustomCardWithPrimary extends StatelessWidget {
  final Widget child;
  final String ?title;
  final Color? colors;
  final Color ?titleColor;
  final EdgeInsets ?marign;
  final EdgeInsets ?padding;
  const AppCustomCardWithPrimary({Key? key, required this.child, this.title, this.titleColor, this.marign, this.padding,this.colors}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marign ?? const EdgeInsets.only(bottom: 12),
      padding: padding?? const EdgeInsets.all(12),
      // padding: const EdgeInsets.all(6),
      decoration: ThemeConfig.boxDecorationWithRoundBorder(
          context,
          color: Theme.of(context).primaryColor),
      child: title==null? child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("$title", style: ThemeConfig.textStyleTitle(context)!.copyWith(color: titleColor?? Theme.of(context).primaryColor.withOpacity(0.8)),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Divider(color: Theme.of(context).primaryColor.withOpacity(0.8),),
          ),
          child,
        ],
      ),);
  }
}
