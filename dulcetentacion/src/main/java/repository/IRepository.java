package repository;

import java.util.List;

public interface IRepository<T> {
	T findById(int id);
    List<T> findAll();
    Integer save(T entity);
    Integer update(T entity);
    Integer delete(int id);
}
