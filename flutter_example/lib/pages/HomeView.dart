import 'package:flutter/material.dart';
import 'package:flutter_example/components/BaseAppBar.dart';
import 'package:flutter_example/pages/Home.dart';
import 'package:flutter_example/components/LoadMoreItem.dart';
import 'package:flutter_example/components/UsersListItem.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TabLoveView extends StatelessWidget {
  HomeAction act;
  Home widget;

  TabLoveView(this.act, this.widget);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: widget.keyScaffold,
        backgroundColor: Colors.transparent,
        appBar: BaseToolBar(
          title: 'Loadmore',
          //leftIcon: Icons.arrow_back_ios,
          //onLeftPress: viewModel.onLeftPress,
          rightIcon: Icons.info,
          onRightPress: act.onRightMenuClick,
        ).build(context),
        body: new Stack(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(0),
              color: Colors.white,
              child: new LiquidPullToRefresh(
                key: widget.refreshIndicatorKey,
                onRefresh: act.onRefresh,
                backgroundColor: Colors.blue,
                color: Colors.grey[200],
                showChildOpacityTransition: false,
                scrollController: widget.listControl,
                height: 80,
                child: new ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: widget.users.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return (index == widget.users.length)
                          ? new LoadMoreItemLabel(widget.isTheEnd)
                          : new UsersListItem(widget.users[index],
                              () => act.onItemClicked(index));
                    }),
              ),
            ),
            widget.isLoading
                ? new Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  )
                : new Container(),
          ],
        ));
  }
}

abstract class HomeAction {
  Future<void> onRefresh() {}

  void onLastItemShowing() {}

  void onTopItemShowing() {}

  void onItemClicked(int index);

  void onRightMenuClick();
}
