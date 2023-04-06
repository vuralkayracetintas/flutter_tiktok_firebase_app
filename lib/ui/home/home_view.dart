// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/di/locator.dart';
import 'package:tiktok_app/ui/home/home_view_model.dart';
import 'package:tiktok_app/widgets/my_action_item.dart';
import 'package:tiktok_app/widgets/video_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Tiktok App'),
          actions: [
            MyActionWidget(
              onPressed: () {
                locator<AppBaseViewModel>().changeTheme();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: model.videos == null
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.videos!.length,
                  itemBuilder: (context, index) {
                    return VideoWidget(
                      video: model.videos![index],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
