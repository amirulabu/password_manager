import 'package:flutter/material.dart';
import 'package:password_manager/core/viewModel/landing_view_model.dart';
import 'package:password_manager/ui/view/base_view.dart';
import 'package:password_manager/ui/view/new_item.dart';
import 'package:password_manager/ui/view/user_info.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.getUserInfo();
      },
      builder: (context, vm, _) {
        return Consumer<LandingViewModel>(builder: (context, viewModel, _) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Password Manager'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        viewModel.getUserInfo();
                      },
                      icon: Icon(Icons.refresh),
                    ),
                    _createNewItem(context, viewModel),
                  ],
                ),
                body: buildWebsite(context, viewModel)),
          );
        });
      },
    );
  }

  Widget _createNewItem(BuildContext context, LandingViewModel viewModel) {
    return ButtonTheme(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minWidth: 0,
      height: 0,
      child: IconButton(
        icon: Icon(Icons.add_circle_outline),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider<LandingViewModel>.value(
              value: viewModel,
              child: NewItem(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWebsite(BuildContext context, LandingViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.infoList.length,
      itemBuilder: (context, index) {
        final info = viewModel.infoList[index];
        return ListTile(
          title: Text(info.website),
          subtitle: Text(info.username),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChangeNotifierProvider<LandingViewModel>.value(
                value: viewModel,
                child: UserInfoView(info: info),
              ),
            ),
          ),
        );
      },
    );
  }
}
