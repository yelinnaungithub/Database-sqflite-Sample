import 'package:db_train/helpers/database_helper.dart';
import 'package:db_train/second.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home:  MyHomePage(

      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Tutorial App'),
      ),
      body: Center(
        child: FutureBuilder(
          future: databaseHelper.getAllData(),
          builder: (context, snapshot) =>

          snapshot.connectionState == ConnectionState.waiting 
          ? CircularProgressIndicator() 
          : ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext content, int index){
              return Card(
                child: ListTile(
                  leading: Icon(Icons.auto_stories_outlined,size: 50,),
                  title: Text(snapshot.data![index].bookName!),
                  subtitle: Text(p.join(snapshot.data![index].bookPrice.toString()+ ' Ks')),
                  trailing: IconButton(onPressed: () async{

                    await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Second(book: snapshot.data![index],)));

         setState(() {});

                  }, 
                  icon: Icon(Icons.edit)),
                ),
              );
            },)
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Second()));

         setState(() {});
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}