package org.example.javaee_test.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "student_score_t")
public class Score {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_score_id")
    private int studentScoreId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", foreignKey = @ForeignKey(name = "fk_student_id"))
    private Student student;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "subject_id", foreignKey = @ForeignKey(name = "fk_subject_id"))
    private Subject subject;

    @Column(name = "score1", precision = 5, scale = 2)
    private BigDecimal score1;

    @Column(name = "score2", precision = 5, scale = 2)
    private BigDecimal score2;

    // Constructors
    public Score() {}

    public Score(Student student, Subject subject, BigDecimal score1, BigDecimal score2) {
        this.student = student;
        this.subject = subject;
        this.score1 = score1;
        this.score2 = score2;
    }

    // Calculate final grade based on formula: 0.3 * score1 + 0.7 * score2
    public double calculateFinalScore() {
        if (score1 == null || score2 == null) return 0.0;
        return (score1.doubleValue() * 0.3) + (score2.doubleValue() * 0.7);
    }

    // Convert score to letter grade
    public String getLetterGrade() {
        double finalScore = calculateFinalScore();
        if (finalScore >= 8.0) return "A";
        else if (finalScore >= 6.0) return "B";
        else if (finalScore >= 4.0) return "D";
        else return "F";
    }

    // Getters and Setters
    public int getStudentScoreId() { return studentScoreId; }
    public void setStudentScoreId(int studentScoreId) { this.studentScoreId = studentScoreId; }

    public Student getStudent() { return student; }
    public void setStudent(Student student) { this.student = student; }

    public Subject getSubject() { return subject; }
    public void setSubject(Subject subject) { this.subject = subject; }

    public BigDecimal getScore1() { return score1; }
    public void setScore1(BigDecimal score1) { this.score1 = score1; }

    public BigDecimal getScore2() { return score2; }
    public void setScore2(BigDecimal score2) { this.score2 = score2; }
}
