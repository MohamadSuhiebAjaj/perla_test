import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:perla_test/core/components/app_text_from_field.dart';
import 'package:perla_test/core/components/error_component.dart';
import 'package:perla_test/core/extentions/box_decoration.dart';
import 'package:perla_test/modules/home/Presentation/controllers/bloc/home_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/svg/home_svgs.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/date_foramter.dart';
import '../../../../core/words/home_words.dart';
import '../../../../core/components/app_button.dart';
import '../../domain/entities/note_entity.dart';
import 'package:animate_do/animate_do.dart';

import '../components/app_drawer.dart';
import '../components/drawer_icon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetAllNotesEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: const DrawerIcon(),
        ),
        drawer: const AppDrawer(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is FailureHomeState) {
              return ErrorComponent(state.message);
            }
            if (state is SuccessHomeState) {
              return Column(
                children: [
                  _buildAddNoteComponent(context),
                  Expanded(
                    child: DefaultTextStyle(
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                      child: FadeInUpBig(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          itemCount: state.entities.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return _buildTableHeader(context);
                            }
                            return _buildTableRow(context,
                                note: state.entities[index - 1]);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 28.sp,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTableRow(BuildContext context, {required NoteEntity note}) {
    return SizedBox(
      width: 100.w,
      height: 13.w,
      child: Row(
        children: [
          SizedBox(width: 5.w),
          Expanded(
            flex: 3,
            child: Text(
              note.text,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              DataFormater.formatDate(note.createdAt),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: FittedBox(
                    child: SvgPicture.asset(
                      HomeSvgs.editIcon,
                      width: 16.sp,
                      height: 16.sp,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _deleteNote(context, note.id),
                  child: FittedBox(
                    child: SvgPicture.asset(
                      HomeSvgs.deleteIcon,
                      width: 16.sp,
                      height: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context) => Container(
      height: 14.w,
      decoration: Theme.of(context).homeHeaderTheme,
      child: Row(
        children: [
          SizedBox(width: 5.w),
          Expanded(
            child: Text(
              HomeWords.text,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.black),
            ),
          ),
          Expanded(
              child: Text(
            HomeWords.date,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.black),
          ))
        ],
      ));

  Widget _buildAddNoteComponent(BuildContext context) => Container(
        height: 14.h,
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.w, bottom: 2.w),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: AppTextFormField(
                hint: HomeWords.enterYourText,
                controller: textController,
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
                child: AppButton(
              margin: EdgeInsets.symmetric(vertical: 1.5.h),
              lable: HomeWords.add,
              onTap: () => _addNote(context),
            )),
          ],
        ),
      );

  void _addNote(BuildContext context) {
    if (textController.text.isEmpty) return;
    context.read<HomeBloc>().add(AddNoteEvent(textController.text));
    textController.clear();
  }

  void _deleteNote(BuildContext context, int id) =>
      context.read<HomeBloc>().add(DeleteNoteEvent(id));
}
