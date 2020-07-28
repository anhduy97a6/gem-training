package application.data.serviceImpl;

import application.data.model.AttributesModel;
import application.data.repository.AttributesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttributesService {
    @Autowired
    AttributesRepository attributesRepository;

    public List<AttributesModel> findAll() {
        return attributesRepository.findAll();
    }

    public boolean deleteAttributes(int id) {
        try {
            attributesRepository.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
