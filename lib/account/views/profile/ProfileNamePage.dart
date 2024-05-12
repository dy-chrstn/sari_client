import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sari/widgets/form/textfield.dart';

import '../../../utils/theme/colors.dart';
import '../../../utils/theme/typography.dart';

class ProfileName extends StatefulWidget {
  const ProfileName({super.key});

  @override
  State<ProfileName> createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Center(
              child: Text(
                'Sari',
                style: TextStyle(
                    fontSize: screenSize.height * 0.10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            SizedBox(
              height: screenSize.height * 0.12,
              width: screenSize.height * 0.12,
              child: Card(
                color: AppColors.primaryColor,
                shape: CircleBorder(),
                child: Icon(Icons.person, color: AppColors.dirtyWhite, size: screenSize.height * 0.06,),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Text('What should we call you?', style: AppTypography.heading1),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            TextField(
              decoration: AppForm.whiteField.copyWith(labelText: 'Name'),
            ),
            
            SizedBox(
              height: screenSize.height * 0.10,
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/profile/create/createPin');
                  },
                  style: AppForm.darkButton,
                  child: const Text(
                    'DONE',
                    style: TextStyle(color: AppColors.dirtyWhite),
                  )),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
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
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
