package org.example.javaee_test.repository;


import org.example.javaee_test.entity.Subject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ejb.Stateless;
import java.util.List;

@Stateless
public class SubjectRepositoryImpl implements SubjectRepository {

    @PersistenceContext(unitName = "sisPU")
    private EntityManager entityManager;

    @Override
    public void save(Subject subject) {
        entityManager.persist(subject);
    }

    @Override
    public Subject findById(int id) {
        return entityManager.find(Subject.class, id);
    }

    @Override
    public List<Subject> findAll() {
        return entityManager.createQuery("SELECT s FROM Subject s", Subject.class)
                .getResultList();
    }

    @Override
    public void update(Subject subject) {
        entityManager.merge(subject);
    }

    @Override
    public void delete(int id) {
        Subject subject = findById(id);
        if (subject != null) {
            entityManager.remove(subject);
        }
    }
}

