package com.project.worldcupsystem.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "stadium")
public class Stadium {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long stadiumId;
    private String name;
    private String shape;
    private Long seatsCount;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "vip_lounge_id", referencedColumnName = "id")
    private VipLounge vipLounge;
    @OneToMany
    private List<Match> matches;


    public Stadium() {
    }

    public Stadium(String name, String shape, Long seatsCount) {
        this.name = name;
        this.shape = shape;
        this.seatsCount = seatsCount;
    }

    public Long getStadiumId() {
        return stadiumId;
    }

    public void setStadiumId(Long stadiumId) {
        this.stadiumId = stadiumId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape;
    }

    public Long getSeatsCount() {
        return seatsCount;
    }

    public void setSeatsCount(Long seatsCount) {
        this.seatsCount = seatsCount;
    }

    public List<Match> getStadiumMatches() {
        return matches;
    }

    public void setStadiumMatches(List<Match> stadiumMatches) {
        this.matches = stadiumMatches;
    }
}
