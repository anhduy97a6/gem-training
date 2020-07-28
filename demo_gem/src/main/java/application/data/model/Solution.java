package application.data.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "dbo_solution")
public class Solution {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "solution_id")
    @Id
    private int id;

    private String name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "solution")
    private List<AttributesValueModel> attributesValueList = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<AttributesValueModel> getAttributesValueList() {
        return attributesValueList;
    }

    public void setAttributesValueList(List<AttributesValueModel> attributesValueList) {
        this.attributesValueList = attributesValueList;
    }
}
