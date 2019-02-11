import 'package:flutter/material.dart';
import 'package:flutter_example/styles/StyleConst.dart';
import 'package:flutter_example/entities/UserEntity.dart';
import 'package:intl/intl.dart';

class UsersListItem extends StatelessWidget {
  UserEntity user;
  VoidCallback clicked;

  UsersListItem(this.user, this.clicked);

  @override
  Widget build(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Colors.white,
      child: InkWell(
        onTap: clicked,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Card(
                      elevation: 2,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: new Container(
                        width: 100,
                        height: 100,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: new DecorationImage(
                            image: new NetworkImage(user?.photo ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ),
                new Flexible(
                  child: new Container(
                    padding: EdgeInsets.all(5),
                    height: 100,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              user?.name ?? 'Name',
                              style: TextStyleConst.b16(color: Colors.black),
                            ),
                            new Text(
                              '${user?.address?.city}' ?? 'City',
                              style: TextStyleConst.b12(color: Colors.black),
                            ),
                          ],
                        ),
                        new Text(
                          user?.bio ?? 'Description',
                          style: TextStyleConst.n12(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(
                                  Icons.whatshot,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                new Text(
                                  '${new NumberFormat("#,###").format(user?.followers)}' ??
                                      'Name',
                                  style: TextStyleConst.b12(color: Colors.blue),
                                ),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(
                                  Icons.youtube_searched_for,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                new Text(
                                  '${new NumberFormat("#,###").format(user?.following)}' ??
                                      'Name',
                                  style: TextStyleConst.b12(color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
