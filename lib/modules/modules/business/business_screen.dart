
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/layout/layout.news_app/cubit/cubit.dart';
import 'package:news_app/layout/layout.news_app/cubit/states.dart';
class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    var list=NewsCubit.get(context).business;
    return BlocConsumer <NewsCubit,NewsStates>(
      listener: (context, state) {} ,
    builder:(context,state){
      return condBuilder(list,context);
    }
    );
    }
  }

