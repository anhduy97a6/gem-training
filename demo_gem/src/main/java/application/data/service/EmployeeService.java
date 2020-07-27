package application.data.service;


import application.data.model.Employee;
import org.springframework.data.domain.Page;

import java.util.List;

public interface EmployeeService {

    List<Employee> findAll();

}
