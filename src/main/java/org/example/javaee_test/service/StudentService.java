package org.example.javaee_test.service;

import org.example.javaee_test.entity.Student;
import org.example.javaee_test.entity.Score;
import org.example.javaee_test.repository.ScoreRepositoryImpl;
import org.example.javaee_test.repository.StudentRepository;
import org.example.javaee_test.repository.ScoreRepository;
import org.example.javaee_test.repository.StudentRepositoryImpl;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.transaction.Transactional;
import java.util.List;

@Stateless
@Transactional
public class StudentService {

    @EJB
    private StudentRepository studentDAO;

    @EJB
    private ScoreRepository studentScoreDAO;

    public void createStudent(Student student) {
        studentDAO.save(student);
    }

    public List<Student> getAllStudents() {
        return studentDAO.findAll();
    }

    public Student getStudentById(int id) {
        return studentDAO.findById(id);
    }

    public List<Score> getStudentScores(int studentId) {
        return studentScoreDAO.findByStudentId(studentId);
    }

    public List<Score> getAllStudentScores() {
        return studentScoreDAO.findAll();
    }
}

