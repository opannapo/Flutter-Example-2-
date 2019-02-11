import 'package:flutter/material.dart';
import 'package:flutter_example/styles/StyleConst.dart';

class LoadMoreItemAction extends StatelessWidget {
  bool isLoading;
  VoidCallback onPressed;

  LoadMoreItemAction(this.isLoading, this.onPressed);

  @override
  Widget build(BuildContext ctx) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: EdgeInsets.all(10),
          width: 200,
          height: 40,
          child: new FloatingActionButton(
              elevation: 3.0,
              backgroundColor: Colors.blue,
              onPressed: onPressed,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: new Text('Load More ?',
                  style: TextStyleConst.n12(color: Colors.white))),
        )
      ],
    );
  }
}

class LoadMoreItemLabel extends StatelessWidget {
  bool isTheEnd;

  LoadMoreItemLabel(this.isTheEnd);

  @override
  Widget build(BuildContext ctx) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
            margin: EdgeInsets.all(40),
            child: !isTheEnd
                ? new Row(
                    children: <Widget>[
                      new Container(
                        width: 50,
                        height: 0.05,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 25,
                        height: 25,
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: CircularProgressIndicator(
                          strokeWidth: 0.8,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      new Container(
                        width: 50,
                        height: 0.05,
                        color: Colors.blue,
                      ),
                    ],
                  )
                : new Row(
                    children: <Widget>[
                      new Container(
                        width: 50,
                        height: 0.1,
                        color: Colors.blue,
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: new Text('No More',
                            style: TextStyleConst.n12(color: Colors.blue)),
                      ),
                      new Container(
                        width: 50,
                        height: 0.1,
                        color: Colors.blue,
                      ),
                    ],
                  ))
      ],
    );
  }
}
