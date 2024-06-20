import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
     this.smallSize = false,
     this.maxline = 2,
     this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxline;
  final TextAlign textAlign;


  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: smallSize ?  Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.labelLarge,
      overflow: TextOverflow.ellipsis,
      maxLines: maxline,
      textAlign: textAlign,
    );
  }
}