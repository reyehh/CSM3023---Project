import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    private Connection connection;

    // Constructor to initialize connection (assumed you have a DataSource or ConnectionFactory)
    public PaymentDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to insert a new payment record
    public void insertPayment(Payment payment) throws SQLException {
        String sql = "INSERT INTO payments (paymentID, staffID, parcelID, charge, typeOfCharge) " +
                     "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, payment.getPaymentID());
            statement.setString(2, payment.getStaffID());
            statement.setString(3, payment.getParcelID());
            statement.setDouble(4, payment.getCharge());
            statement.setString(5, payment.getTypeOfCharge());
            statement.executeUpdate();
        }
    }

    // Method to update an existing payment record
    public void updatePayment(Payment payment) throws SQLException {
        String sql = "UPDATE payments SET staffID=?, parcelID=?, charge=?, typeOfCharge=? " +
                     "WHERE paymentID=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, payment.getStaffID());
            statement.setString(2, payment.getParcelID());
            statement.setDouble(3, payment.getCharge());
            statement.setString(4, payment.getTypeOfCharge());
            statement.setString(5, payment.getPaymentID());
            statement.executeUpdate();
        }
    }

    // Method to delete a payment record
    public void deletePayment(String paymentID) throws SQLException {
        String sql = "DELETE FROM payments WHERE paymentID=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, paymentID);
            statement.executeUpdate();
        }
    }

    // Method to retrieve all payments
    public List<Payment> getAllPayments() throws SQLException {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM payments";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Payment payment = new Payment();
                payment.setPaymentID(resultSet.getString("paymentID"));
                payment.setStaffID(resultSet.getString("staffID"));
                payment.setParcelID(resultSet.getString("parcelID"));
                payment.setCharge(resultSet.getDouble("charge"));
                payment.setTypeOfCharge(resultSet.getString("typeOfCharge"));
                payments.add(payment);
            }
        }
        return payments;
    }

    // Method to get a payment by ID
    public Payment getPaymentByID(String paymentID) throws SQLException {
        Payment payment = null;
        String sql = "SELECT * FROM payments WHERE paymentID=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, paymentID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    payment = new Payment();
                    payment.setPaymentID(resultSet.getString("paymentID"));
                    payment.setStaffID(resultSet.getString("staffID"));
                    payment.setParcelID(resultSet.getString("parcelID"));
                    payment.setCharge(resultSet.getDouble("charge"));
                    payment.setTypeOfCharge(resultSet.getString("typeOfCharge"));
                }
            }
        }
        return payment;
    }
}
