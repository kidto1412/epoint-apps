part of 'form_violation_cubit.dart';

abstract class FormViolationState extends Equatable {
  const FormViolationState();

  @override
  List<Object> get props => [];
}

class FormViolationInitial extends FormViolationState {}

class FormViolationLoaded extends FormViolationState {
  final List<FormOfViolation> formv;

  FormViolationLoaded(this.formv);

  @override
  List<Object> get props => [formv];
}

class FormViolationLoadingFailed extends FormViolationState {
  final String message;

  FormViolationLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
