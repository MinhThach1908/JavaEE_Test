package org.example.javaee_test.repository;


import org.example.javaee_test.entity.Student;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ejb.Stateless;
import java.util.List;

@Stateless
public class StudentRepositoryImpl implements StudentRepository {

    @PersistenceContext(unitName = "sisPU")
    private EntityManager entityManager;

    @Override
    public void save(Student student) {
        entityManager.persist(student);
    }

    @Override
    public Student findById(int id) {
        return entityManager.find(Student.class, id);
    }

    @Override
    public List<Student> findAll() {
        return entityManager.createQuery("SELECT s FROM Student s", Student.class)
                .getResultList();
    }

    @Override
    public void update(Student student) {
        entityManager.merge(student);
    }

    @Override
    public void delete(int id) {
        Student student = findById(id);
        if (student != null) {
            entityManager.remove(student);
        }
    }
}
