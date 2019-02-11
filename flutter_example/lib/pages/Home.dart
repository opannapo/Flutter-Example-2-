import 'package:flutter/material.dart';
import 'package:flutter_example/utils/API.dart';
import 'package:flutter_example/pages/HomeView.dart';
import 'package:flutter_example/entities/UserEntity.dart';

class Home extends StatefulWidget {
  var keyScaffold = new GlobalKey<ScaffoldState>();
  var refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  ScrollController listControl;

  List<UserEntity> users;
  bool isLoading = false;
  bool isTheEnd = false;

  Home();

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home>
    with TickerProviderStateMixin
    implements HomeAction {
  int limit = 3;
  int totalLoad = 0;

  @override
  void initState() {
    super.initState();
    widget.isLoading = true;
    widget.users = new List();
    widget.listControl = new ScrollController();
    widget.listControl.addListener(() {
      scrollListener();
    });

    onRefresh();
  }

  @override
  void dispose() {
    widget.keyScaffold.currentState.dispose();
    widget.refreshIndicatorKey.currentState.dispose();
    widget.listControl.dispose();
    widget.users = null;
    widget.isLoading = null;
    widget.isTheEnd = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => new TabLoveView(this, widget);

  @override
  Future<void> onRefresh() {
    setState(() {
      widget.isTheEnd = false;
      totalLoad = 0;
      widget.users.clear();
    });
    return loadApi();
  }

  @override
  void onLastItemShowing() {
    if (totalLoad == limit) {
      setState(() {
        widget.isTheEnd = true;
      });
    } else {
      loadApi();
    }
  }

  @override
  void onTopItemShowing() {}

  @override
  void onItemClicked(int index) {
    showSnackbar(widget.users[index].name);
  }

  @override
  void onRightMenuClick() {
    showSnackbar('Toolbar Right Button Clicked');
  }

  Future<void> loadApi() {
    return API.getUsers().then((data) {
      setState(() {
        totalLoad++;
        widget.users.addAll(data);
        widget.isLoading = false;
        widget.refreshIndicatorKey.currentState?.show();
      });
    }).catchError((e) => onFailure(e));
  }

  void showSnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text('${msg}'),
      action: SnackBarAction(label: 'Close', onPressed: () {}),
    );
    widget.keyScaffold.currentState.showSnackBar(snackBar);
  }

  void onFailure(String e) {
    print(e);
    showSnackbar(e);
    setState(() {
      widget.isLoading = false;
    });
  }

  void scrollListener() {
    print(widget.listControl.offset);
    if (widget.listControl.offset >=
            widget.listControl.position.maxScrollExtent &&
        !widget.listControl.position.outOfRange) {
      onLastItemShowing();
      //showSnackbar("LAST");
    }
    if (widget.listControl.offset <=
            widget.listControl.position.minScrollExtent &&
        !widget.listControl.position.outOfRange) {
      onTopItemShowing();
      //showSnackbar("TOP");
    }
  }
}
