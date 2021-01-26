import 'package:counter_apps/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        title: "Increment Decrement Bloc",
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Increment & Decrement Bloc"),),
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                showResult(state),
                SizedBox(height: 50,),
                showAction(state),
                SizedBox(height: 50,),
                FlatButton(
                  color: Colors.greenAccent,
                  child: Icon(Icons.add),
                  onPressed: () {
                    context.read<HomeBloc>().add(EventIncrease());
                  },
                ),
                FlatButton(
                  color: Colors.redAccent,
                  child: Icon(Icons.remove),
                  onPressed: () {
                    context.read<HomeBloc>().add(EventDecrease());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showResult(HomeState state){
    if(state is StateIncrement){
      return Text("${state.number}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),);
    }else if(state is StateDecrement){
      return Text("${state.number}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),);
    }else if(state is StateInitial){
      return Text("0", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),);
    }else if(state is StateZero){
      return Text("${state.message}", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),);
    }
  }

  Widget showAction(HomeState state){
    if(state is StateIncrement){
      return Column(
        children: [
          Text("Last Action:",),
          Text("${state}", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),),
        ],
      );
    }else if(state is StateDecrement){
      return Column(
        children: [
          Text("Last Action:",),
          Text("${state}", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),),
        ],
      );
    }else{
      return Text("$state", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),);
    }
  }
}
