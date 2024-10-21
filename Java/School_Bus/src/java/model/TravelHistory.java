/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class TravelHistory {
    private int historyId;
    private String pickUpPoint, dropOffPoint, boardingTime, alightingTime;
    private Students student;
    private Buses bus;

    public TravelHistory() {
    }

    public TravelHistory(int historyId, String pickUpPoint, String dropOffPoint, String boardingTime, String alightingTime, Students student, Buses bus) {
        this.historyId = historyId;
        this.pickUpPoint = pickUpPoint;
        this.dropOffPoint = dropOffPoint;
        this.boardingTime = boardingTime;
        this.alightingTime = alightingTime;
        this.student = student;
        this.bus = bus;
    }

    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public String getPickUpPoint() {
        return pickUpPoint;
    }

    public void setPickUpPoint(String pickUpPoint) {
        this.pickUpPoint = pickUpPoint;
    }

    public String getDropOffPoint() {
        return dropOffPoint;
    }

    public void setDropOffPoint(String dropOffPoint) {
        this.dropOffPoint = dropOffPoint;
    }

    public String getBoardingTime() {
        return boardingTime;
    }

    public void setBoardingTime(String boardingTime) {
        this.boardingTime = boardingTime;
    }

    public String getAlightingTime() {
        return alightingTime;
    }

    public void setAlightingTime(String alightingTime) {
        this.alightingTime = alightingTime;
    }

    public Students getStudent() {
        return student;
    }

    public void setStudent(Students student) {
        this.student = student;
    }

    public Buses getBus() {
        return bus;
    }

    public void setBus(Buses bus) {
        this.bus = bus;
    }
    
    
}
