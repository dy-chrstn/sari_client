import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:sari/common/widgets/form/AppForm.dart';

import '../../common/utils/theme/colors.dart';
import '../../common/utils/theme/typography.dart';

class AddProductForm extends StatefulWidget {
  final String userId;
  const AddProductForm({super.key, required this.userId});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  // TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController sizes = TextEditingController();
  TextEditingController types = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    try {
      String fileName =
          'products/${widget.userId}/${DateTime.now().millisecondsSinceEpoch}.png';
      await FirebaseStorage.instance.ref(fileName).putFile(_image!);
    } catch (e) {
      Logger().e('Failed to upload image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textColor,
                    ),
                  ),
                  backgroundColor: AppColors.dirtyWhite,
                  title: const Text(
                    'Add Product',
                    style: AppTypography.heading1,
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  FormBuilder(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenSize.height * 0.02),
                            FormBuilderTextField(
                                name: 'Name',
                                controller: name,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.dirtyWhite,
                                    labelText: 'Name')),
                            SizedBox(height: screenSize.height * 0.02),
                            FormBuilderTextField(
                                name: 'Description',
                                controller: description,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.dirtyWhite,
                                    labelText: 'Description')),
                            SizedBox(height: screenSize.height * 0.02),
                            FormBuilderTextField(
                                name: 'Stock',
                                controller: quantity,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.dirtyWhite,
                                    labelText: 'Stock')),
                            SizedBox(height: screenSize.height * 0.02),
                            Divider(
                              color: AppColors.secondaryColor,
                              thickness: 1,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            Text('Set Sizes',
                                style: AppTypography.heading1.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            SizedBox(height: screenSize.height * 0.01),
                            TextFormField(
                              controller: sizes,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.dirtyWhite,
                                  labelText: 'Sizes'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    style: AppForm.darkButton,
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.dirtyWhite,
                                    )),
                                SizedBox(width: screenSize.width * 0.02),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.remove,
                                      color: AppColors.dirtyWhite,
                                    ),
                                    style: AppForm.darkButton),
                              ],
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            const Divider(
                              color: AppColors.secondaryColor,
                              thickness: 1,
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            Text('Set Types',
                                style: AppTypography.heading1.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            SizedBox(height: screenSize.height * 0.01),
                            TextFormField(
                              controller: types,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.dirtyWhite,
                                  labelText: 'Types'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    style: AppForm.darkButton,
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.dirtyWhite,
                                    )),
                                SizedBox(width: screenSize.width * 0.02),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: AppForm.darkButton,
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.dirtyWhite,
                                    )),
                              ],
                            ),
                            SizedBox(height: screenSize.height * 0.05),
                            GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                color: AppColors.dirtyWhite,
                                child: _image == null
                                    ? const Icon(Icons.camera_alt,
                                        size: 50, color: AppColors.textColor)
                                    : Image.file(_image!, fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.05),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState
                                          ?.saveAndValidate() ??
                                      false) {
                                    await _uploadImage();
                                    // Handle form submission logic here
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ))
                ]))
              ],
            )));
  }
}
