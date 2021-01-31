import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'helperWidget.dart';

Widget networkImage(String url, {double height, double width}) {
  return Container(
    height: height ?? double.infinity,
    width: width ?? double.infinity,
    child: CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: BoxFit.fill,
        height: height ?? double.infinity,
        width: width ?? double.infinity,
      ),
      placeholder: (context, url) => loader,
      errorWidget: (context, url, error) {
        if (url == null) {
          return erorrWidget;
        }
        return null;
      },
    ),
  );
}
