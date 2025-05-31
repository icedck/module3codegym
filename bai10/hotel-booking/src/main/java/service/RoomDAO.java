package service;

import model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    public List<Room> getRoomsByHotelId(int hotelId) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT room_id, hotel_id, room_number, room_type, price_per_night, max_guests FROM rooms WHERE hotel_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, hotelId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setHotelId(rs.getInt("hotel_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setPricePerNight(rs.getBigDecimal("price_per_night"));
                room.setMaxGuests(rs.getInt("max_guests"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching rooms by hotel ID: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }
        return rooms;
    }

    public Room getRoomById(int roomId) {
        Room room = null;
        String sql = "SELECT room_id, hotel_id, room_number, room_type, price_per_night, max_guests FROM rooms WHERE room_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, roomId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setHotelId(rs.getInt("hotel_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setPricePerNight(rs.getBigDecimal("price_per_night"));
                room.setMaxGuests(rs.getInt("max_guests"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching room by ID: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }
        return room;
    }

    /**
     * Lấy danh sách các phòng trống trong khoảng thời gian đã cho.
     * Logic: Lấy tất cả các phòng của khách sạn, sau đó loại bỏ những phòng đã có booking
     * trong khoảng thời gian (checkInDate, checkOutDate) đã cho.
     * Một phòng được coi là đã đặt nếu có bất kỳ booking nào mà:
     * (check_in_date_booking < checkOut AND check_out_date_booking > checkIn)
     * Đây là điều kiện OVERLAP giữa hai khoảng thời gian.
     */
    public List<Room> getAvailableRooms(int hotelId, Date checkIn, Date checkOut) {
        List<Room> availableRooms = new ArrayList<>();
        String sql = "SELECT r.room_id, r.hotel_id, r.room_number, r.room_type, r.price_per_night, r.max_guests " +
                "FROM rooms r " +
                "WHERE r.hotel_id = ? AND r.room_id NOT IN (" +
                "    SELECT b.room_id FROM bookings b " +
                "    WHERE b.status IN ('pending', 'confirmed') AND b.room_id = r.room_id AND (" +
                "        (b.check_in_date < ? AND b.check_out_date > ?) OR " + // Booking starts before checkOut and ends after checkIn
                "        (? BETWEEN b.check_in_date AND b.check_out_date) OR " + // Check-in date is within a booking
                "        (? BETWEEN b.check_in_date AND b.check_out_date)" +    // Check-out date is within a booking
                "    )" +
                ")";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, hotelId);
            pstmt.setDate(2, checkOut); // Param cho b.check_in_date < checkOut
            pstmt.setDate(3, checkIn);  // Param cho b.check_out_date > checkIn
            pstmt.setDate(4, checkIn);  // Param cho checkIn BETWEEN
            pstmt.setDate(5, checkOut); // Param cho checkOut BETWEEN
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setHotelId(rs.getInt("hotel_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setPricePerNight(rs.getBigDecimal("price_per_night"));
                room.setMaxGuests(rs.getInt("max_guests"));
                availableRooms.add(room);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching available rooms: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources(conn, pstmt, rs);
        }
        return availableRooms;
    }


    private void closeResources(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.err.println("Error closing ResultSet: " + e.getMessage());
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                System.err.println("Error closing PreparedStatement: " + e.getMessage());
            }
        }
        DBConnection.closeConnection(conn);
    }
}