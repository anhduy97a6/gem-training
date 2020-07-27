package application.data.serviceImpl;

import application.data.model.Employee;
import application.data.repository.EmployeeRepository;
import application.data.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;



    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }


    public Page<Employee> findByName(Pageable pageable, String name) {
        return employeeRepository.getListEmployeeByFullNameContaining(pageable, name);
    }
    public void saveEmployee(Employee employee) {
        employeeRepository.save(employee);
    }
    public Employee findById(int employeeId) {
        return employeeRepository.findOne(employeeId);
    }
    public boolean deleteEmployee(int employeeId) {
        try {
            employeeRepository.delete(employeeId);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
