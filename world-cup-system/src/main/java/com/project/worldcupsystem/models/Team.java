package com.project.worldcupsystem.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "team")
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;
    private String name;
    private String nationality;
    private Long winsCount;
    private Long drawsCount;
    private Long lossCount;
    private Integer rating;
    @OneToMany
    private List<Match> homeMatches;

    @OneToMany
    private List<Match> awayMatches;

    public Team() {

    }

    public Team(String name, String nationality, Long winsCount, Long drawsCount, Long lossCount, Integer rating, List<Match> homeMatches, List<Match> awayMatches) {
        this.name = name;
        this.nationality = nationality;
        this.winsCount = winsCount;
        this.drawsCount = drawsCount;
        this.lossCount = lossCount;
        this.rating = rating;
        this.homeMatches = homeMatches;
        this.awayMatches = awayMatches;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Long getWinsCount() {
        return winsCount;
    }

    public void setWinsCount(Long winsCount) {
        this.winsCount = winsCount;
    }

    public Long getDrawsCount() {
        return drawsCount;
    }

    public void setDrawsCount(Long drawsCount) {
        this.drawsCount = drawsCount;
    }

    public Long getLossCount() {
        return lossCount;
    }

    public void setLossCount(Long lossCount) {
        this.lossCount = lossCount;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public List<Match> getHomeMatches() {
        return homeMatches;
    }

    public void setHomeMatches(List<Match> homeMatches) {
        this.homeMatches = homeMatches;
    }

    public List<Match> getAwayMatches() {
        return awayMatches;
    }

    public void setAwayMatches(List<Match> awayMatches) {
        this.awayMatches = awayMatches;
    }
}
