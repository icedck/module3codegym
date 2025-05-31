package model;

import java.math.BigDecimal;

public class Room {
    private int roomId;
    private int hotelId;
    private String roomNumber;
    private String roomType;
    private BigDecimal pricePerNight;
    private int maxGuests;

    public Room() {
    }

    public Room(int roomId, int hotelId, String roomNumber, String roomType, BigDecimal pricePerNight, int maxGuests) {
        this.roomId = roomId;
        this.hotelId = hotelId;
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.pricePerNight = pricePerNight;
        this.maxGuests = maxGuests;
    }

    // Getters and Setters
    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public BigDecimal getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(BigDecimal pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public int getMaxGuests() {
        return maxGuests;
    }

    public void setMaxGuests(int maxGuests) {
        this.maxGuests = maxGuests;
    }

    @Override
    public String toString() {
        return "Room [roomId=" + roomId + ", hotelId=" + hotelId + ", roomNumber=" + roomNumber + ", roomType="
                + roomType + ", pricePerNight=" + pricePerNight + ", maxGuests=" + maxGuests + "]";
    }
}