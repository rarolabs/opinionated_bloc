import 'dart:async';

import 'package:build/build.dart';
import 'package:opinionated_bloc_annotations/opinionated_bloc_annotations.dart';
import 'package:opinionated_bloc_generator/src/template.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

import 'package:analyzer/src/dart/element/element.dart';

import 'factory_visitor.dart';

/// Iterate over a bloc ast and generate its .opinionated source code
class OpinionatedBuilder extends GeneratorForAnnotation<OpinionatedBloc> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    var bloc = element as ClassElementImpl;

    for (var argument in bloc.supertype.typeArguments) {
      if (argument.element.name.endsWith("Event")) {
        FactoryVisitor visitor = FactoryVisitor();
        argument.element.visitChildren(visitor);
        return Template(
          blocName: bloc.identifier,
          events: visitor.events,
        ).toDart();
      }
    }

    return null;
  }
}
