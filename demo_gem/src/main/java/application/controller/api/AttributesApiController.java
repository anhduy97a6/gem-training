package application.controller.api;

import application.data.serviceImpl.AttributesService;
import application.model.api.BaseApiResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/solution")
public class AttributesApiController {

    @Autowired
    AttributesService attributesService;

    @GetMapping("/delete/{id}")
    public BaseApiResult deleteColumn(@PathVariable int id) {
        BaseApiResult result = new BaseApiResult();
        if (attributesService.deleteAttributes(id)) {
            result.setSuccess(true);
            result.setMessage("Delete Success");
        }
        else {
            result.setMessage("false");
            result.setSuccess(false);
        }
        return result;

    }
}
