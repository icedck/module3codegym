package model;

public class Hotel {
    private int hotelId;
    private String name;
    private String address;

    public Hotel() {
    }

    public Hotel(int hotelId, String name, String address) {
        this.hotelId = hotelId;
        this.name = name;
        this.address = address;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Hotel [hotelId=" + hotelId + ", name=" + name + ", address=" + address + "]";
    }
}
