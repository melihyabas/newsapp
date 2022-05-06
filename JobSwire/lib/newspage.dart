
import 'package:flutter/material.dart';
import 'package:jobswire/detail.dart';
import 'package:jobswire/models/newmodel.dart';
import 'package:jobswire/services/getNews.dart';

class NewsPage extends StatefulWidget {
//  const SettingsWidget({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var newArr;
  var nameArr;
  void getNews() async {
    newArr = await getNewsService.getNews();
    for(int i=0 ; i<newArr.length ; i++){
      int count = 0;

      var tempStr="";
      for(int j=0 ; j<newArr[i]['name'].length ; j++){
        tempStr += newArr[i]['name'][j];

        if(newArr[i]['name'][j]==' '){
          count++;
          if(count%4 == 0){
            tempStr += '\n';

          }
        }
      }
      newArr[i]['name'] = tempStr;
    }

    for(int i=0 ; i<newArr.length ; i++){
      int count = 0;

      var tempStr="";
      for(int j=0 ; j<newArr[i]['description'].length ; j++){
        tempStr += newArr[i]['description'][j];

        if(newArr[i]['description'][j]==' '){
          count++;
          if(count%5 == 0){
            tempStr += '\n';

          }
        }
      }
      newArr[i]['description'] = tempStr;
    }
  }

  GetNewsService getNewsService = new GetNewsService();


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    getNews();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 108,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.95,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFEEEEEE),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Haberler',
                                  style: TextStyle(
                                    fontSize: 35,
                                    foreground: Paint()

                                      ..color = Colors.blue[600]!,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      for (int i = 0; i < newArr.length; i++)

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: InkWell(
                                    onTap: () async {
                                        NewModel newModel = NewModel(newArr[i]['key'], newArr[i]['url'], newArr[i]['description'] ,newArr[i]['image'],newArr[i]['name'] , newArr[i]['source']);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage(newModel),
                                          ),
                                        );
                                    },
                                    child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: 350,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xFFB6ADAD),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 1, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [

                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [


                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                            AlignmentDirectional(
                                                                -0.05, 0),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  10,
                                                                  0,
                                                                  0,
                                                                  0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                children: [

                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        2,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                    child: Text(
                                                                      newArr[i]['name'],
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                        fontSize: 17,
                                                                        foreground: Paint()

                                                                          ..color = Colors.blue[700]!,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              children: [
                                                                Padding(

                                                                  padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      55,
                                                                      8,
                                                                      8,
                                                                      8),
                                                                  child:
                                                                  ClipRRect(

                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        10),
                                                                    child: Image.network(
                                                                      newArr[i]['image'],
                                                                      width: 205,
                                                                      height: 205,

                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                )
                                                                )],
                                                            )
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}