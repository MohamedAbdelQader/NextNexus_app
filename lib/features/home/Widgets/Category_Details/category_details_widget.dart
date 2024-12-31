import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_nexus_app/Remote/api_manager.dart';
import 'package:next_nexus_app/features/home/Widgets/Category_Details/articles_List.dart';

import '../../../../Remote/Sources_Response/Source.dart';

class CategoryDetailsWidget extends StatefulWidget {
  String category;
   CategoryDetailsWidget({super.key,required this.category});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category),
        builder: (context,snapshot){
          if( snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: (){
                  setState(() {});
                } ,
                    child:  Text("Retry")),
              ],
            );
          }
          var response=snapshot.data ;
          if(response?.status=="error"){
            return Column(
              children: [
                Text(response?.message.toString()??""),
                ElevatedButton(onPressed: (){
                  setState(() {});
                } ,
                    child:  Text("Retry")),
              ],
            );
          }
          List<Source> sources=response?.sources??[];
          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding:  REdgeInsets.all(16.0),
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    dividerHeight: 0,
                    tabs: sources.map((source) => Tab(

                      child: Container(
                          padding: REdgeInsets.symmetric(
                              horizontal:20,
                              vertical: 5 ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Text(source.name??"")),
                    )).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                        children: sources.map((source) =>
                            ArticlesList(sourceId: source.id??"",)
                        ).toList()),
                  )

                ],
              ),
            ),
          );
        });
  }
}
