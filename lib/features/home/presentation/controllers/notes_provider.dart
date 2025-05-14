import 'package:flutter_application_1/features/home/domain/entities/note_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Status { initial, loading, success, error }

class NoteRequest {
  final List<NoteEntity> notes;
  final Status notesStatus;
  final String? error;

  const NoteRequest({required this.notes, required this.notesStatus, this.error});
  factory NoteRequest.initialState() {
    return NoteRequest(notes: [], notesStatus: Status.initial);
  }
}

class NoteNotifier extends StateNotifier<NoteRequest> {
  NoteNotifier() : super(NoteRequest.initialState());
}

final notesProvider = StateNotifierProvider<NoteNotifier, NoteRequest>((ref) {
  return NoteNotifier();
});
