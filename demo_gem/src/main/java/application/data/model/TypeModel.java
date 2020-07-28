package application.data.model;

import javax.persistence.*;

@Entity(name = "type")
public class TypeModel {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "type_id")
    @Id
    private int id;

    @Column(name = "type_code")
    private String typeCode;

    private String name;



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
