import 'package:flutter/material.dart';

class EProductTitleText extends StatelessWidget {
  const EProductTitleText({super.key,
    required this.title,
     this.smallSize =false,
     this.maxline =1,
    this.textAling = TextAlign.left});

  final String title;
  final bool smallSize;
  final int maxline;
  final TextAlign? textAling;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize? Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline,
      textAlign: textAling,
    );
  }
}
