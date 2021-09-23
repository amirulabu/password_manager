import 'package:flutter/material.dart';
import 'package:password_manager/core/locator/locator.dart';
import 'package:password_manager/core/model/info.dart';
import 'package:password_manager/core/service/navigator/navigation_service.dart';
import 'package:password_manager/core/viewModel/landing_view_model.dart';
import 'package:password_manager/ui/view/base_view.dart';
import 'package:provider/provider.dart';

class UserInfoView extends StatelessWidget {
  final Info info;

  UserInfoView({required this.info});

  final NavigationService? _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(
        viewModel: Provider.of<LandingViewModel>(context),
        builder: (context, viewModel, _) {
          return Consumer<LandingViewModel>(builder: (context, viewModel, _) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    info.website,
                  ),
                ),
                body: displayUserInfo(context, viewModel),
                floatingActionButton: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      viewModel.deleteUserInfo(info);
                      _navigationService!.pop();
                    },
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      primary: Colors.black,
                      side: BorderSide(width: 2, color: Colors.black),
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  Widget displayUserInfo(BuildContext context, LandingViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: ListView(
        children: <Widget>[
          Row(
            children: [
              Text('Username :', style: TextStyle(fontSize: 20)),
              Text(
                info.username,
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Password :', style: TextStyle(fontSize: 20)),
              Visibility(
                visible: viewModel.isPasswordVisible,
                replacement: Text(
                  '***********',
                  style: TextStyle(fontSize: 20),
                ),
                child: Text(
                  info.password,
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: Icon(
                  Icons.visibility,
                ),
                onPressed: () {
                  viewModel.toggleIsPasswordVisible();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
