import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/colors.dart';

class MyImage extends StatelessWidget {
  final String? url;
  const MyImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url == null ? '' : '$baseImage$url',
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CupertinoActivityIndicator(
        color: ProjectColors.errorColor,
      )),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: ProjectColors.errorColor,
      ),
    );
  }
}
