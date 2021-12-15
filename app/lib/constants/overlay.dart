import 'package:connect_proj/constants/colors.dart';
import 'package:flutter/material.dart';

final overlayLoading = OverlayEntry(builder: (_) {
  return Container(
    color: Colors.black45,
    alignment: Alignment.center,
    child: CircularProgressIndicator(color: green),
  );
});
