import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget articleBuilderItem(article,context)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${article['urlToImage']}')
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,//??
            children: [
              Expanded(
                child: Text('${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      )
    ],
  ),
);
Widget condBuilder(list,context){//context??/
  return ConditionalBuilder(
      condition:list.length>0,
      builder: (context)=>ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>articleBuilderItem(list[index],context),
          separatorBuilder: (context,index)=>myDivider(),
          itemCount:10),
      fallback: (context)=>Center(child: CircularProgressIndicator())//??
  );
}