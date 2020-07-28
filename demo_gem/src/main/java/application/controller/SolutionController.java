package application.controller;

import application.data.model.AttributesModel;
import application.data.model.AttributesValueModel;
import application.data.model.Solution;
import application.data.model.TypeModel;
import application.data.serviceImpl.AttributesService;
import application.data.serviceImpl.SolutionService;
import application.data.serviceImpl.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/solution")
public class SolutionController {
    @Autowired
    SolutionService solutionService;
    @Autowired
    AttributesService attributesService;
    @Autowired
    TypeService typeService;


    @GetMapping("")
    public String solution(Model model) {
        List<Solution> solutionList = solutionService.findAll();
        List<AttributesModel> attributesList = attributesService.findAll();
        List<TypeModel> typeModelList = typeService.findAll();


        model.addAttribute("attribute", new AttributesModel());
        model.addAttribute("typeList" , typeModelList);
        model.addAttribute("solutionList", solutionList);
        model.addAttribute("attributesList", attributesList);
        return "/solution/solution";
    }

    @GetMapping("/add")
    public String addSolution(Model model) {


        List<AttributesModel> attributesList = attributesService.findAll();
        List<AttributesValueModel> attributesValueModelList = new ArrayList<>();
        Solution solution = new Solution();

        for (AttributesModel attributesModel : attributesList) {
            AttributesValueModel attributesValue = new AttributesValueModel();
            attributesValue.setAttributes(attributesModel);
            attributesValue.setSolution(solution);
            attributesValueModelList.add(attributesValue);

        }

        solution.setAttributesValueList(attributesValueModelList);





        model.addAttribute("solution", solution);

        return "/solution/add-solution";
    }
    @PostMapping("/add")
    public String addPostSolution(Model model,
                                  @ModelAttribute("solution") Solution solution) {


        for (AttributesValueModel attributesValueModel : solution.getAttributesValueList()) {
            attributesValueModel.setSolution(solution);

        }

        solutionService.save(solution);


        return "redirect:/solution";
    }
}
