import 'dart:async';

import 'package:opinionated_bloc_annotations/opinionated_bloc_annotations.dart';
import 'package:opinionated_bloc_generator/src/opinionated_builder.dart';
import 'package:source_gen_test/source_gen_test.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
      'test', 'bloc_with_single_event_src.dart');

  initializeBuildLogTracking();
  testAnnotatedElements<OpinionatedBloc>(reader, OpinionatedBuilder());
}
