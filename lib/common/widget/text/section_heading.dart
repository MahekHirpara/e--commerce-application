import 'package:flutter/material.dart';

class ESectionHeading extends StatelessWidget {
  const ESectionHeading({
    super.key,
    required this.text,
    this.btnTitle= 'View all',
    this.textColor,
    this.showActionbutton=true,
    this.onPressed,
  });
  final String text,btnTitle;
  final Color? textColor;
  final bool showActionbutton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
        if(showActionbutton) TextButton(onPressed: onPressed, child: Text(btnTitle)),


      ],
    );
  }
}