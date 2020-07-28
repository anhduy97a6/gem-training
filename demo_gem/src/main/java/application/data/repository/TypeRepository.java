package application.data.repository;

import application.data.model.TypeModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeRepository extends JpaRepository<TypeModel, Integer> {
}
