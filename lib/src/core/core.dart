library core;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../data/models/stock.dart';
import '../data/models/user.dart';
import '../presentation/screens/screens.dart';

part 'extensions/build_context.dart';
part 'extensions/text_style.dart';

part 'routes/app_router.dart';
part 'routes/routes_name.dart';

part 'storage/storage_manager.dart';

part 'themes/app_color_scheme.dart';
part 'themes/app_colors.dart';
part 'themes/app_text_theme.dart';
part 'themes/app_themes.dart';