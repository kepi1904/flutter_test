import 'package:flutter/material.dart';
import 'package:flutter_demo_paging/user_detail_page.dart';
import 'package:flutter_demo_paging/user_model.dart';
import 'package:transparent_image/transparent_image.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  bool loading = true;
  int page = 0;
  ScrollController scrollController = new ScrollController();

  findAllUser() {
    User.findAll(++page).then((value) {
      users.addAll(value);
      loading = false;
      setState(() {});
    }).catchError((err) {
      //popup message
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var triggerLoadMore = 0.9 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > triggerLoadMore) {
        findAllUser();
      }
    });
    findAllUser();
  }

  Widget getBody() {
    if (users.isEmpty) {
      if (loading) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ),
        );
      }
    } else {
      return ListView.builder(
          controller: scrollController,
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];
            return Container(
              padding: const EdgeInsets.all(2),
              height: 150,
              child: Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return UserDetailPage(userInfo: user);
                      }),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage, image: user.avatar),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.account_box_rounded,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  ),
                                  Text(
                                    user.firstName + ' ' + user.lastName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  ),
                                  Text(user.email),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('User List'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                page = 0;
                users = [];
                loading = true;
                setState(() {});
                findAllUser();
              },
              child: const Icon(
                Icons.refresh,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: getBody(),
      backgroundColor: Colors.green[100],
    );
  }
}
