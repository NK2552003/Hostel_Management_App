//
// Generated file. Do not edit.
// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.
//

// @dart = 3.5

import 'dart:io'; // flutter_ignore: dart_io_import.
import 'package:file_picker/file_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:open_file_android/open_file_android.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker_ios/image_picker_ios.dart';
import 'package:open_file_ios/open_file_ios.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector_linux/file_selector_linux.dart';
import 'package:image_picker_linux/image_picker_linux.dart';
import 'package:open_file_linux/open_file_linux.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector_macos/file_selector_macos.dart';
import 'package:image_picker_macos/image_picker_macos.dart';
import 'package:open_file_mac/open_file_mac.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector_windows/file_selector_windows.dart';
import 'package:image_picker_windows/image_picker_windows.dart';
import 'package:open_file_windows/open_file_windows.dart';

@pragma('vm:entry-point')
class _PluginRegistrant {

  @pragma('vm:entry-point')
  static void register() {
    if (Platform.isAndroid) {
      try {
        FilePickerIO.registerWith();
      } catch (err) {
        print(
          '`file_picker` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        ImagePickerAndroid.registerWith();
      } catch (err) {
        print(
          '`image_picker_android` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        OpenFileAndroid.registerWith();
      } catch (err) {
        print(
          '`open_file_android` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isIOS) {
      try {
        FilePickerIO.registerWith();
      } catch (err) {
        print(
          '`file_picker` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        ImagePickerIOS.registerWith();
      } catch (err) {
        print(
          '`image_picker_ios` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        OpenFileIOS.registerWith();
      } catch (err) {
        print(
          '`open_file_ios` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isLinux) {
      try {
        FilePickerLinux.registerWith();
      } catch (err) {
        print(
          '`file_picker` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        FileSelectorLinux.registerWith();
      } catch (err) {
        print(
          '`file_selector_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        ImagePickerLinux.registerWith();
      } catch (err) {
        print(
          '`image_picker_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        OpenFileLinux.registerWith();
      } catch (err) {
        print(
          '`open_file_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isMacOS) {
      try {
        FilePickerMacOS.registerWith();
      } catch (err) {
        print(
          '`file_picker` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        FileSelectorMacOS.registerWith();
      } catch (err) {
        print(
          '`file_selector_macos` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        ImagePickerMacOS.registerWith();
      } catch (err) {
        print(
          '`image_picker_macos` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        OpenFileMac.registerWith();
      } catch (err) {
        print(
          '`open_file_mac` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isWindows) {
      try {
        FilePickerWindows.registerWith();
      } catch (err) {
        print(
          '`file_picker` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        FileSelectorWindows.registerWith();
      } catch (err) {
        print(
          '`file_selector_windows` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        ImagePickerWindows.registerWith();
      } catch (err) {
        print(
          '`image_picker_windows` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        OpenFileWindows.registerWith();
      } catch (err) {
        print(
          '`open_file_windows` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    }
  }
}
