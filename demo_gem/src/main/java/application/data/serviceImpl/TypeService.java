package application.data.serviceImpl;

import application.data.model.TypeModel;
import application.data.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeService {

    @Autowired
    TypeRepository typeRepository;

    public List<TypeModel> findAll() {
        return typeRepository.findAll();
    }
}
