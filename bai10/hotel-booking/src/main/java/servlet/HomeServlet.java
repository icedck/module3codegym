package servlet;

import model.Hotel;
import service.HotelDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet; // Để cấu hình Servlet bằng Annotation
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home") // Ánh xạ URL cho Servlet này
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // Cần thiết cho Servlet

    private HotelDAO hotelDAO;

    public void init() {
        hotelDAO = new HotelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Hotel> hotels = hotelDAO.getAllHotels();
            request.setAttribute("hotels", hotels); // Đặt danh sách khách sạn vào request scope
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp"); // Chuyển tiếp đến index.jsp
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Có thể chuyển hướng đến trang lỗi
            request.setAttribute("errorMessage", "Error loading hotels: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

    // Đối với ứng dụng đặt phòng, bạn có thể không cần doPost cho HomeServlet
    // protected void doPost(HttpServletRequest request, HttpServletResponse response)
    //         throws ServletException, IOException {
    //     doGet(request, response); // Thường chuyển hướng doPost về doGet nếu không có xử lý form
    // }
}
