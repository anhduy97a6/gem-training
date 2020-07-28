package application.data.serviceImpl;

import application.data.model.Solution;
import application.data.repository.SolutionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SolutionService {

    @Autowired
    SolutionRepository solutionRepository;

    public List<Solution> findAll() {
        return solutionRepository.findAll();
    }
    public boolean save(Solution solution) {
        try {
            solutionRepository.save(solution);
            return true;
        } catch (Exception e) {
            return false;
        }

    }
}
