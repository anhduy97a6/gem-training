package application.data.model;

import javax.persistence.*;

@Entity(name = "attributes_value")
public class AttributesValueModel {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "attributes_value_id")
    @Id
    private int id;

    @ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "solution_id")
    private Solution solution;

    @ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "attributes_id")
    private AttributesModel attributes;

    private String value;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Solution getSolution() {
        return solution;
    }

    public void setSolution(Solution solution) {
        this.solution = solution;
    }

    public AttributesModel getAttributes() {
        return attributes;
    }

    public void setAttributes(AttributesModel attributes) {
        this.attributes = attributes;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
