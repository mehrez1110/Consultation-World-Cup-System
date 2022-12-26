package com.project.worldcupsystem.models;

import javax.persistence.*;

@Entity
@Table(name = "vip_lounge")
public class VipLounge {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;
    private Long Length;
    private Long width;
    private Integer rowsCount;
    private Integer seatsPerRowCount;
    @OneToOne
    private Stadium stadium;

    public VipLounge() {
    }

    public VipLounge(Long length, Long width, Integer rowsCount, Integer seatsPerRowCount) {
        Length = length;
        this.width = width;
        this.rowsCount = rowsCount;
        this.seatsPerRowCount = seatsPerRowCount;
    }

    public Long getLength() {
        return Length;
    }

    public void setLength(Long length) {
        Length = length;
    }

    public Long getWidth() {
        return width;
    }

    public void setWidth(Long width) {
        this.width = width;
    }

    public Integer getRowsCount() {
        return rowsCount;
    }

    public void setRowsCount(Integer rowsCount) {
        this.rowsCount = rowsCount;
    }

    public Integer getSeatsPerRowCount() {
        return seatsPerRowCount;
    }

    public void setSeatsPerRowCount(Integer seatsPerRowCount) {
        this.seatsPerRowCount = seatsPerRowCount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
