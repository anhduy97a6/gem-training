package application.data.repository;

import application.data.model.AttributesValueModel;
import application.data.model.Solution;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttributesValueRepository extends JpaRepository<AttributesValueModel, Integer> {
}
