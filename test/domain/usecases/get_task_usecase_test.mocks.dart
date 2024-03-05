// Mocks generated by Mockito 5.4.4 from annotations
// in task_management_app/test/domain/usecases/get_task_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:task_management_app/domain/entities/task_entity.dart' as _i3;
import 'package:task_management_app/domain/repository/task_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i2.TaskRepository {
  @override
  List<_i3.Task> getTasks() => (super.noSuchMethod(
        Invocation.method(
          #getTasks,
          [],
        ),
        returnValue: <_i3.Task>[],
        returnValueForMissingStub: <_i3.Task>[],
      ) as List<_i3.Task>);

  @override
  void addTask(_i3.Task? task) => super.noSuchMethod(
        Invocation.method(
          #addTask,
          [task],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deleteTask(int? id) => super.noSuchMethod(
        Invocation.method(
          #deleteTask,
          [id],
        ),
        returnValueForMissingStub: null,
      );
}
