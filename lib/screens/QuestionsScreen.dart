import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran/utilities/GetQuestionsDate.dart';
import 'package:quran/utilities/firebase_auth.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfffbf9f6),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            GetBuilder<firebase_auth>(
              init: firebase_auth(),
              builder: (v) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () => v.signOut(),
                    child: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
              ),
            )
          ],
          title: Text(
            'الأسئلة الشائعة',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        body: GetBuilder<GetQuestionDate>(
            init: GetQuestionDate(),
            builder: (v) => FutureBuilder<List>(
                  future: v.getDate(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: new CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      ));
                    }

                    if (snapshot.hasError) {
                      return Center(
                          child: new CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      ));
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data![i]['question']),
                                          InkWell(
                                              onTap: () => v.indexChange(i),
                                              child: Icon(Icons.add_circle))
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (v.indexOpen == i)
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      color: Colors.grey.shade200,
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                    ),
                                  if (v.indexOpen == i)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(snapshot.data![i]['answer']),
                                    )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                )),
      ),
    );
  }
}
