import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_bloc.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_event.dart';
import 'package:gooddeals/features/ShoppingItems/presentation/Bloc/items/remote/remote_items_state.dart';
import 'package:gooddeals/injection_container.dart';


void main() async {
  await InitDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteItemsBloc>(
      create: (context) => sl()..add(const GetItemsEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: _buildbody(),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildbody() {
    return BlocBuilder<RemoteItemsBloc, RemoteItemsState>(
      builder: (_, state) {
        if (state is RemoteItemsLoading) {
          return LinearProgressIndicator();
        }
        if (state is RemoteItemsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteItemsDone) {
          return ListView.builder(
            itemCount: state.product!.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text("srayansh"),);
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
