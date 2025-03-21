import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pozitolk/constants/app_images.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/pages/consultation/view_model/consultation_view_model.dart';
import 'package:provider/provider.dart';
class UploadImageSquare extends StatefulWidget {
  const UploadImageSquare({
    super.key,
    required this.onTap,
    this.image,
    this.imageFile,
    this.hideImage = false,
  });

  final void Function(File? image)? onTap;
  final String? image;
  final File? imageFile;
  final bool hideImage;

  @override
  State<UploadImageSquare> createState() => _UploadImageSquareState();
}

class _UploadImageSquareState extends State<UploadImageSquare> {
  File? imageFile;

  @override
  void initState() {
    if (widget.imageFile != null) {
      imageFile = widget.imageFile;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ConsultationViewModel>();
    return Container(
      padding: EdgeInsets.all(8),
      height: 82,
      decoration: BoxDecoration(
        color: context.color.base03,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            // padding: const EdgeInsets.all(30),
            // margin: const EdgeInsets.symmetric(horizontal: 21),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            width: 66,
            height: 66,
            child: Center(
              child: (widget.hideImage)
                  ? Image.asset( AppImages.defaultImage)
                  : (imageFile == null && widget.image == null)
                      ? Image(
                          image: AssetImage(AppImages.defaultImage),
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : (widget.image != null)
                          ? CachedNetworkImage(
                              imageUrl: widget.image!,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              maxHeightDiskCache: 1000,
                            )
                          : Image.file(
                              imageFile!,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              ImagePicker picker = ImagePicker();
              final file = await picker.pickImage(source: ImageSource.gallery);
              if (file == null) return;
              imageFile = File(file.path);
              read.imageUrl = null;
              widget.onTap!(imageFile!);
              setState(() {});
            },
            child: Text(
              'Заменить',
              style: context.textStyle.s14w400Manrope.copyWith(
                fontWeight: FontWeight.w500,
                color: context.color.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
