import 'package:flutter/material.dart';
import 'package:sari/common/utils/theme/colors.dart';
import 'package:sari/common/utils/theme/typography.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Notes List',
          style: AppTypography.heading1,
        ),
      ),
    ));
  }
}
