library opinionated_bloc_generator;

import 'package:build/build.dart';
import 'package:opinionated_bloc_generator/src/opinionated_builder.dart';
import 'package:source_gen/source_gen.dart';

Builder opinionatedBlocBuilder(BuilderOptions options) => PartBuilder([
      OpinionatedBuilder(),
    ], '.opinionated.dart');
