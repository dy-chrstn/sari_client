import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';
import '../../utils/theme/typography.dart';

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
                height: screenSize.height * 0.03,
              ),
              Card(child: Icon(Icons.person),),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Text('What should we call you?', style: AppTypography.heading1),
              SizedBox( height: screenSize.height * 0.03,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/profile/create/pin');
                }, 
                child: Text('DONE')),
              SizedBox( height: screenSize.height * 0.03,),
              ElevatedButton(
                onPressed: (){}, 
                child: Text('CANCEL')),
              
          ],
        ),
      ),
    ));
  }
}
