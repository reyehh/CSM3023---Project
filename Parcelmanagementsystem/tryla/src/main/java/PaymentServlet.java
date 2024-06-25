import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class PaymentServlet extends HttpServlet {
    private PaymentDAO paymentDAO;

    public void init() throws ServletException {
        super.init();
        // Initialize DAO (You need to have a DataSource or ConnectionFactory)
        paymentDAO = new PaymentDAO(MyConnectionFactory.getConnection());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/list":
                    listPayments(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/delete":
                    deletePayment(request, response);
                    break;
                default:
                    listPayments(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Error in doGet method: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/insert":
                    insertPayment(request, response);
                    break;
                case "/update":
                    updatePayment(request, response);
                    break;
                default:
                    listPayments(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Error in doPost method: " + e.getMessage());
        }
    }

    private void listPayments(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Payment> payments = paymentDAO.getAllPayments();
        request.setAttribute("payments", payments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/paymentList.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String paymentID = request.getParameter("paymentID");
        Payment existingPayment = paymentDAO.getPaymentByID(paymentID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/paymentForm.jsp");
        request.setAttribute("payment", existingPayment);
        dispatcher.forward(request, response);
    }

    private void insertPayment(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String paymentID = request.getParameter("paymentID");
        String staffID = request.getParameter("staffID");
        String parcelID = request.getParameter("parcelID");
        double charge = Double.parseDouble(request.getParameter("charge"));
        String typeOfCharge = request.getParameter("typeOfCharge");

        Payment newPayment = new Payment(paymentID, staffID, parcelID, charge, typeOfCharge);
        paymentDAO.insertPayment(newPayment);
        response.sendRedirect(request.getContextPath() + "/list");
    }

    private void updatePayment(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String paymentID = request.getParameter("paymentID");
        String staffID = request.getParameter("staffID");
        String parcelID = request.getParameter("parcelID");
        double charge = Double.parseDouble(request.getParameter("charge"));
        String typeOfCharge = request.getParameter("typeOfCharge");

        Payment updatedPayment = new Payment(paymentID, staffID, parcelID, charge, typeOfCharge);
        paymentDAO.updatePayment(updatedPayment);
        response.sendRedirect(request.getContextPath() + "/list");
    }

    private void deletePayment(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String paymentID = request.getParameter("paymentID");
        paymentDAO.deletePayment(paymentID);
        response.sendRedirect(request.getContextPath() + "/list");
    }

    private static class MyConnectionFactory {

        private static Connection getConnection() {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        public MyConnectionFactory() {
        }
    }
}
