import 'package:flutter/material.dart';
import 'package:news/my_app.dart';
import 'package:news/core/services/local_storage/hive_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveManager.init();
  runApp(const MyApp());
}
