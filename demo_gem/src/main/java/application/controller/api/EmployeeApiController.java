package application.controller.api;

import application.data.model.Employee;
import application.data.service.EmployeeService;
import application.data.serviceImpl.EmployeeServiceImpl;
import application.model.api.BaseApiResult;
import application.model.api.DataApiResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/employee")
public class EmployeeApiController {

    @Autowired
    EmployeeServiceImpl employeeServiceImpl;

    @PostMapping("/create")
    public BaseApiResult createEmployee(@RequestBody Employee employee) {
        DataApiResult result = new DataApiResult();
        try {
            employeeServiceImpl.saveEmployee(employee);
            result.setData(employee.getId());
            result.setMessage("Save employee successfully " + employee.getId());
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage(e.getMessage());
        }
        return result;

    }

    @GetMapping("/detail/{employeeId}")
    public DataApiResult updateEmployee(@PathVariable int employeeId) {
        DataApiResult result = new DataApiResult();
        try {
            Employee employee = employeeServiceImpl.findById(employeeId);
            if (employee == null) {
                result.setMessage("Can not find ID: " + employeeId);
                result.setSuccess(false);
            } else {
                result.setSuccess(true);
                result.setData(employee);
                result.setMessage("Success");

            }
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage(e.getMessage());
        }
        return result;

    }

    @PostMapping("/update")
    public BaseApiResult updateEmployee(@RequestBody Employee employee) {
        DataApiResult result = new DataApiResult();
        try {
            employeeServiceImpl.saveEmployee(employee);
            result.setData(employee.getId());
            result.setMessage("Save employee successfully " + employee.getId());
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMessage(e.getMessage());
        }
        return result;

    }

    @DeleteMapping("/delete/{employeeId}")
    public BaseApiResult deleteEmployee(@PathVariable int employeeId) {
        BaseApiResult result = new BaseApiResult();
        if (employeeServiceImpl.deleteEmployee(employeeId)) {
            result.setMessage("Delete Succes " + employeeId);
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setMessage("false");
        }
        return result;
    }
}
