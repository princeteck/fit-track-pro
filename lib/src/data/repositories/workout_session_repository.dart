import 'package:injectable/injectable.dart';

import '../../domain/entities/workout_session_entity.dart';
import '../../core/services/isolate_service.dart';
import '../services/workout_database_service.dart';

abstract class WorkoutSessionRepository {
  Future<void> saveSession(WorkoutSessionEntity session);
  Future<List<WorkoutSessionEntity>> getAllSessions();
  Future<WorkoutSessionEntity?> getSessionById(String id);
  Future<List<WorkoutSessionEntity>> getSessionsByWorkoutPlan(
    String workoutPlanId,
  );
  Future<void> deleteSession(String id);
}

@Injectable(as: WorkoutSessionRepository)
class WorkoutSessionRepositoryImpl implements WorkoutSessionRepository {
  final IsolateService _isolateService;
  final WorkoutDatabaseService _databaseService;

  WorkoutSessionRepositoryImpl(this._isolateService, this._databaseService);

  @override
  Future<void> saveSession(WorkoutSessionEntity session) async {
    await _isolateService.executeDatabaseOperation(
      operationId: 'save_session_${session.id}',
      operation: () async {
        await _databaseService.insertSession(session);
      },
    );
  }

  @override
  Future<List<WorkoutSessionEntity>> getAllSessions() async {
    final sessions = await _isolateService.executeDatabaseOperation(
      operationId: 'get_all_sessions',
      operation: () async {
        return await _databaseService.getAllSessions();
      },
    );

    return sessions;
  }

  @override
  Future<WorkoutSessionEntity?> getSessionById(String id) async {
    return await _isolateService.executeDatabaseOperation(
      operationId: 'get_session_by_id_$id',
      operation: () async {
        return await _databaseService.getSessionById(id);
      },
    );
  }

  @override
  Future<List<WorkoutSessionEntity>> getSessionsByWorkoutPlan(
    String workoutPlanId,
  ) async {
    return await _isolateService.executeDatabaseOperation(
      operationId: 'get_sessions_by_plan_$workoutPlanId',
      operation: () async {
        return await _databaseService.getSessionsByWorkoutPlan(workoutPlanId);
      },
    );
  }

  @override
  Future<void> deleteSession(String id) async {
    await _isolateService.executeDatabaseOperation(
      operationId: 'delete_session_$id',
      operation: () async {
        await _databaseService.deleteSession(id);
      },
    );
  }
}
