package org.example.javaee_test.repository;

import org.example.javaee_test.entity.Student;
import java.util.List;

public interface StudentRepository {
    void save(Student student);
    Student findById(int id);
    List<Student> findAll();
    void update(Student student);
    void delete(int id);
}
