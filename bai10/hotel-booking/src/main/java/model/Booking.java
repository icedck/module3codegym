package model;

import java.math.BigDecimal;
import java.sql.Date; // Sử dụng java.sql.Date cho tương thích với CSDL
import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private int roomId;
    private String customerName;
    private String customerEmail;
    private Date checkInDate;
    private Date checkOutDate;
    private BigDecimal totalPrice;
    private String status;
    private Timestamp createdAt;

    public Booking() {
    }

    public Booking(int bookingId, int roomId, String customerName, String customerEmail, Date checkInDate,
                   Date checkOutDate, BigDecimal totalPrice, String status, Timestamp createdAt) {
        this.bookingId = bookingId;
        this.roomId = roomId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.totalPrice = totalPrice;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Booking [bookingId=" + bookingId + ", roomId=" + roomId + ", customerName=" + customerName
                + ", customerEmail=" + customerEmail + ", checkInDate=" + checkInDate + ", checkOutDate="
                + checkOutDate + ", totalPrice=" + totalPrice + ", status=" + status + ", createdAt=" + createdAt
                + "]";
    }
}
