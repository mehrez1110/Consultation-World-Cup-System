package com.project.worldcupsystem.models;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "_match")
public class Match {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "homeTeam_id", referencedColumnName = "id")

    private Team homeTeam;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "awayTeam_id", referencedColumnName = "id")

    private Team awayTeam;
    @ManyToOne
    @JoinColumn(name="stadium_id", referencedColumnName = "id")
    private Stadium matchStadium;
    private LocalDateTime matchDate;
    private Integer homeTeamScore;
    private Integer awayTeamScore;
    private String lineManA;
    private String lineManB;
    private String referee;
    @OneToMany
    private List<Ticket> tickets;

    public Match() {
    }


    public Match(Team homeTeam, Team awayTeam, Stadium matchStadium, LocalDateTime matchDate, Integer homeTeamScore, Integer awayTeamScore, String lineManA, String lineManB, String referee, List<Ticket> tickets) {
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.matchStadium = matchStadium;
        this.matchDate = matchDate;
        this.homeTeamScore = homeTeamScore;
        this.awayTeamScore = awayTeamScore;
        this.lineManA = lineManA;
        this.lineManB = lineManB;
        this.referee = referee;
        this.tickets = tickets;
    }

    public Integer getHomeTeamScore() {
        return homeTeamScore;
    }

    public void setHomeTeamScore(Integer homeTeamScore) {
        this.homeTeamScore = homeTeamScore;
    }

    public Integer getAwayTeamScore() {
        return awayTeamScore;
    }

    public void setAwayTeamScore(Integer awayTeamScore) {
        this.awayTeamScore = awayTeamScore;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Team getHomeTeam() {
        return homeTeam;
    }

    public void setHomeTeam(Team homeTeam) {
        this.homeTeam = homeTeam;
    }

    public Team getAwayTeam() {
        return awayTeam;
    }

    public void setAwayTeam(Team awayTeam) {
        this.awayTeam = awayTeam;
    }

    public Stadium getMatchStadium() {
        return matchStadium;
    }

    public void setMatchStadium(Stadium matchStadium) {
        this.matchStadium = matchStadium;
    }

    public LocalDateTime getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(LocalDateTime matchDate) {
        this.matchDate = matchDate;
    }

    public String getLineManA() {
        return lineManA;
    }

    public void setLineManA(String lineManA) {
        this.lineManA = lineManA;
    }

    public String getLineManB() {
        return lineManB;
    }

    public void setLineManB(String lineManB) {
        this.lineManB = lineManB;
    }

    public String getReferee() {
        return referee;
    }

    public void setReferee(String referee) {
        this.referee = referee;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }
}
