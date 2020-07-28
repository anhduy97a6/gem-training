package application.data.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "attributes")
public class AttributesModel {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "attributes_id")
    @Id
    private int id;

    private String name;



    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "attributes")
    private List<AttributesValueModel> attributesValueModelList = new ArrayList<>();

    @OneToOne()
    private TypeModel typeModel;

    public TypeModel getTypeModel() {
        return typeModel;
    }

    public void setTypeModel(TypeModel typeModel) {
        this.typeModel = typeModel;
    }

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

    public List<AttributesValueModel> getAttributesValueModelList() {
        return attributesValueModelList;
    }

    public void setAttributesValueModelList(List<AttributesValueModel> attributesValueModelList) {
        this.attributesValueModelList = attributesValueModelList;
    }
}
