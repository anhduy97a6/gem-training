package application.controller;

import application.data.model.Employee;
import application.data.serviceImpl.EmployeeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    EmployeeServiceImpl employeeService;

    @GetMapping("")
    public String employee(Model model,
                           @Valid @ModelAttribute(name = "employeeName") Employee employeeName,
                           @RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                           @RequestParam(name = "size", required = false, defaultValue = "8") Integer size) {


        Pageable pageable = new PageRequest(page, size);
        Page<Employee> employeePage = null;

        if (employeeName.getFullname() != null && !employeeName.getFullname().isEmpty()) {
            employeePage = employeeService.findByName(pageable, employeeName.getFullname().trim());
        } else {
            employeePage = employeeService.findByName(pageable, null);
        }
        List<Employee> employeeList = employeePage.getContent();

        model.addAttribute("employeeList", employeeList);
        model.addAttribute("page", employeePage);
        return "employee";
    }
}
