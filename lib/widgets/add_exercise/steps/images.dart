import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wger/providers/add_exercise_provider.dart';
import 'package:wger/widgets/add_exercise/mixins/image_picker_mixin.dart';
import 'package:wger/widgets/add_exercise/preview_images.dart';

class ImagesStepContent extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  const ImagesStepContent({required this.formkey});

  @override
  State<ImagesStepContent> createState() => _ImagesStepContentState();
}

class _ImagesStepContentState extends State<ImagesStepContent> with ExerciseImagePickerMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).add_exercise_image_license,
            style: Theme.of(context).textTheme.caption,
          ),
          Consumer<AddExerciseProvider>(
            builder: (ctx, provider, __) => provider.exerciseImages.isNotEmpty
                ? PreviewExerciseImages(
                    selectedImages: provider.exerciseImages,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => pickImages(context, pickFromCamera: true),
                        icon: const Icon(Icons.camera_alt),
                      ),
                      IconButton(
                        onPressed: () => pickImages(context),
                        icon: const Icon(Icons.collections),
                      ),
                    ],
                  ),
          ),
          Text(
            'Only JPEG, PNG and WEBP files below 20 MB are supported',
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
