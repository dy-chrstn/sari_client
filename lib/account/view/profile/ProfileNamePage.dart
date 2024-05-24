import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sari/widgets/form/AppForm.dart';
import '../../../utils/theme/colors.dart';
import '../../../utils/theme/typography.dart';

class ProfileName extends StatefulWidget {
  final String userId;
  final List<String> names;

  const ProfileName({super.key, required this.userId, required this.names});

  @override
  State<ProfileName> createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
  final TextEditingController nameController = TextEditingController();
  String? nameError;

  @override
  void initState() {
    super.initState();
    Logger().i('Profile List: ${widget.names}');
    nameController.addListener(validateName);
  }

  void validateName() {
    final trimmed = nameController.text.trimRight().toLowerCase();
    Logger().d('trimmed: $trimmed');
    if (widget.names.contains(trimmed)) {
      setState(() {
        nameError = 'Name already exists';
      });
    } else {
      setState(() {
        nameError = null;
      });
    }
  }

  // void onDonePressed() {
  //   validateName(nameController.text);

  //   if (nameError == null) {
  //     GoRouter.of(context).push('/profile/create/pin',
  //         extra: {'userId': widget.userId, 'name': nameController.text});
  //     nameController.clear();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.03),
              Center(
                child: Text(
                  'Sari',
                  style: TextStyle(
                    fontSize: screenSize.height * 0.06,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              SizedBox(
                height: screenSize.height * 0.12,
                width: screenSize.height * 0.12,
                child: Card(
                  color: AppColors.primaryColor,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.person,
                    color: AppColors.dirtyWhite,
                    size: screenSize.height * 0.06,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Text('What should we call you?', style: AppTypography.heading1),
              SizedBox(height: screenSize.height * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: AppForm.whiteField.copyWith(
                      labelText: 'Name',
                      errorText: nameError,
                    ),
                  ),
                  // if (nameError != null && nameError!.isNotEmpty)
                  //   Padding(
                  //     padding: const EdgeInsets.only(top: 8.0),
                  //     child: Text(
                  //       nameError!,
                  //       style: TextStyle(color: Colors.red, fontSize: 12),
                  //     ),
                  //   ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.10),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      setState(() {
                        nameError = 'Name cannot be empty';
                      });
                    
                    } else if (nameError != null && nameError!.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(nameError!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }else if (nameError == null) {
                      GoRouter.of(context).push('/profile/create/createPin',
                          extra: {'userId': widget.userId, 'name': nameController.text});
                      nameController.clear();
                    }
                  },
                  style: AppForm.darkButton,
                  child: const Text(
                    'DONE',
                    style: TextStyle(color: AppColors.dirtyWhite),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  style: AppForm.whiteButton,
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
