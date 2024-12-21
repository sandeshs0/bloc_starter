import 'package:bloc_test/bloc/student_bloc.dart';
import 'package:bloc_test/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentBlocView extends StatelessWidget {
  StudentBlocView({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Bloc'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey2,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey2.currentState!.validate()) {
                    StudentModel student = StudentModel(
                      name: _nameController.text,
                      age: int.parse(_ageController.text),
                      address: _addressController.text,
                    );

                    // Call student bloc
                    context
                        .read<StudentBloc>()
                        .add(AddStudentEvent(student));
                  }
                },
                child: const Text('Submit'),
              ),
              SizedBox(height: 8),
              BlocBuilder<StudentBloc, StudentBlocState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  } else if (state.students.isEmpty) {
                    return const Text('No students added yet');
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.students.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.students[index].name),
                          subtitle: Text(state.students[index].age.toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context
                                  .read<StudentBloc>()
                                  .add(DeleteStudentEvent(index));
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
