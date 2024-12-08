import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // استخدم مكتبة file_picker
import '../../../config/theme/font_system/app_fonts.dart';
import '../../../config/theme/styles_manager.dart';
import '../../../config/theme/sizes_manager.dart';
import '../../config/theme/color_system/app_colors.dart';

class AddFileWidget extends StatelessWidget {
  final ValueChanged<bool>? isLoading;
  final ValueChanged<List<File>>? onGet;

  const AddFileWidget({
    super.key,
    this.onGet,
    this.isLoading,
  });

  Future<void> _pickFiles(BuildContext context) async {
    try {
      isLoading?.call(true); // عرض مؤشر تحميل أثناء اختيار الملفات
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, // للسماح بتحديد أكثر من ملف
        type: FileType.any, // يمكنك تحديد نوع الملفات هنا (مثلاً FileType.custom)
      );

      if (result != null && result.paths.isNotEmpty) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        onGet?.call(files); // استدعاء الوظيفة مع الملفات المحددة
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No files selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick files: $e')),
      );
    } finally {
      isLoading?.call(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff1D42FF),
      child: InkWell(
        onTap: () => _pickFiles(context),
        child: Container(
          width: 100,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Upload',
                style: StylesManager.bold(
                  fontSize: AppFonts.font.large,
                  //color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
