package application.data.repository;

import application.data.model.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface EmployeeRepository extends JpaRepository<Employee,Integer> {
    @Query("SELECT e FROM dbo_employee e " +
            "WHERE (:employeeName IS NULL OR UPPER(e.fullname) LIKE CONCAT('%',UPPER(:employeeName),'%')OR UPPER(e.username) LIKE CONCAT('%',UPPER(:employeeName),'%'))")
    Page<Employee> getListEmployeeByFullNameContaining(Pageable pageable, @Param("employeeName") String employeeName);

}
