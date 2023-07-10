import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../homeeePAG/models/note.dart';
import '../homeeePAG/models/note_data.dart';
import '../homeeePAG/pages/editing_note_page.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}
class _DiaryPageState extends State<DiaryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeNotes();
  }
  void createNewNote(){
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    Note newNote = Note(id: id, text: '');

    goNotePage(newNote, true);
  }

  void goNotePage(Note note, bool isNewNote) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditingNotePage(note: note, isNewNote: isNewNote,),));
  }

  //delete note
  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 90, 181),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewNote,
        elevation: 0,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color:  Color.fromARGB(255, 211, 90, 181),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 25.0, top: 75),
          child: Text(
        'Күнделік',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white)
    ),
    
   
          ),
          

          //list of notes
          value.getAllNotes().length == 0
              ? Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
            child: Text('Күнтізбені толтыр', style: TextStyle(color:Colors.white),),
            
          ),
          
              )
          : CupertinoListSection.insetGrouped(
            children: List.generate(
              value.getAllNotes().length,
                  (index) => CupertinoListTile(
                      title: Text(value.getAllNotes()[index].text),
                    onTap: () => goNotePage(value.getAllNotes() [index], false),
                    trailing: IconButton(icon: Icon(Icons.delete),
                      onPressed: () => deleteNote(value.getAllNotes()[index]),
                    ),
                  ),
            ),backgroundColor:  Color.fromARGB(255, 211, 90, 181),
          ),
      ],
      
      ),
      
      ),
      
    );
  }
}
