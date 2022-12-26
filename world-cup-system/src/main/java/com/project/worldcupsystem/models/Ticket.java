package com.project.worldcupsystem.models;

import javax.persistence.*;

@Entity
@Table(name = "ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;
    @ManyToOne
    @JoinColumn(name="match_id",referencedColumnName = "id")
    private Match ticketMatch;
    private String seatNo;
    private Integer price;
    private Boolean isVip;
    @ManyToOne
    @JoinColumn(name="user_id",referencedColumnName = "id")
    private User ticketOwner;


    public Ticket() {
    }

    public Ticket(Match ticketMatch, String seatNo, Integer price, Boolean isVip) {
        this.ticketMatch = ticketMatch;
        this.seatNo = seatNo;
        this.price = price;
        this.isVip = isVip;
    }

    public Match getTicketMatch() {
        return ticketMatch;
    }

    public void setTicketMatch(Match ticketMatch) {
        this.ticketMatch = ticketMatch;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Boolean getVip() {
        return isVip;
    }

    public void setVip(Boolean vip) {
        isVip = vip;
    }
}
