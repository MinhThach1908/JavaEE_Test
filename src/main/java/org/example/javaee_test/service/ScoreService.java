package org.example.javaee_test.service;

import org.example.javaee_test.entity.Student;
import org.example.javaee_test.entity.Score;
import org.example.javaee_test.entity.Subject;
import org.example.javaee_test.repository.StudentRepository;
import org.example.javaee_test.repository.ScoreRepository;
import org.example.javaee_test.repository.SubjectRepository;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.List;

@Stateless
@Transactional
public class ScoreService {

    @EJB
    private StudentRepository studentDAO;

    @EJB
    private SubjectRepository subjectDAO;

    @EJB
    private ScoreRepository studentScoreDAO;

    public void addScore(int studentId, int subjectId, BigDecimal score1, BigDecimal score2) {
        Student student = studentDAO.findById(studentId);
        Subject subject = subjectDAO.findById(subjectId);

        if (student != null && subject != null) {
            Score score = new Score(student, subject, score1, score2);
            studentScoreDAO.save(score);
        }
    }

    public List<Subject> getAllSubjects() {
        return subjectDAO.findAll();
    }
}
