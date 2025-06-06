package org.example.javaee_test.repository;

import org.example.javaee_test.entity.Subject;
import java.util.List;

public interface SubjectRepository {
    void save(Subject subject);
    Subject findById(int id);
    List<Subject> findAll();
    void update(Subject subject);
    void delete(int id);
}
