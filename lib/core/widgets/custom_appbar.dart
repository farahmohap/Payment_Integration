import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    //svg image must wrapped with flutter_svg pkg(instead of icon)
    leading: const Icon(
      Icons.arrow_back_outlined,
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
