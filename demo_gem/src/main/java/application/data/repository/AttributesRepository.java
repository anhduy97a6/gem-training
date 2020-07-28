package application.data.repository;

import application.data.model.AttributesModel;
import application.data.model.Solution;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttributesRepository extends JpaRepository<AttributesModel, Integer> {
}
