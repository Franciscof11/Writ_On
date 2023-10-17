import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? title;
  final String? note;
  final DateTime? timestamp;
  final String? noteId;
  Note({
    required this.title,
    required this.note,
    required this.timestamp,
    required this.noteId,
  });

  factory Note.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Note(
      title: data?['title'],
      note: data?['note'],
      timestamp: data?['timestamp'],
      noteId: data?['noteId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
      if (noteId != null) 'noteId': noteId,
    };
  }
}
