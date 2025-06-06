package org.example.javaee_test.repository;

import org.example.javaee_test.entity.Score;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ejb.Stateless;
import java.util.List;

@Stateless
public class ScoreRepositoryImpl implements ScoreRepository {

    @PersistenceContext(unitName = "sisPU")
    private EntityManager entityManager;

    @Override
    public void save(Score score) {
        entityManager.persist(score);
    }

    @Override
    public Score findById(int id) {
        return entityManager.find(Score.class, id);
    }

    @Override
    public List<Score> findAll() {
        return entityManager.createQuery(
                "SELECT ss FROM Score ss JOIN FETCH ss.student JOIN FETCH ss.subject",
                Score.class).getResultList();
    }

    @Override
    public List<Score> findByStudentId(int studentId) {
        return entityManager.createQuery(
                        "SELECT ss FROM Score ss JOIN FETCH ss.subject WHERE ss.student.studentId = :studentId",
                        Score.class)
                .setParameter("studentId", studentId)
                .getResultList();
    }

    @Override
    public void update(Score score) {
        entityManager.merge(score);
    }

    @Override
    public void delete(int id) {
        Score score = findById(id);
        if (score != null) {
            entityManager.remove(score);
        }
    }
}

