import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedulex_flutter/app_base/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Hello World

SharedPreferences? _appSp;
FutureOr<SharedPreferences> get appSp async =>
    _appSp ??= await SharedPreferences.getInstance();

ColorScheme get colorScheme => Get.context != null
    ? Theme.of(Get.context!).colorScheme
    : defaultColorSchema;

TextTheme? textTheme = Get.context != null
    ? Theme.of(Get.context!)
        .textTheme
        .apply(displayColor: colorScheme.onBackground)
    : null;
