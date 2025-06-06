package org.example.javaee_test.repository;

import org.example.javaee_test.entity.Score;

import java.util.List;

public interface ScoreRepository {
    void save(Score score);
    Score findById(int id);
    List<Score> findAll();
    List<Score> findByStudentId(int studentId);
    void update(Score score);
    void delete(int id);
}
