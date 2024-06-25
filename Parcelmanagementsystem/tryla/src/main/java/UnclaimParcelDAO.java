import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UnclaimParcelDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/parcelmanagementsystem";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_UNCLAIMPARCELS_SQL = "INSERT INTO unclaimparcels (batchID, parcelNo, parcelID, studID) VALUES (?, ?, ?, ?)";
    private static final String SELECT_UNCLAIMPARCEL_BY_BATCHID = "SELECT * FROM unclaimparcel WHERE batchID = ?";
    private static final String SELECT_ALL_UNCLAIMPARCELS = "SELECT * FROM unclaimparcels";
    private static final String DELETE_UNCLAIMPARCELS_SQL = "DELETE FROM unclaimparcels WHERE batchID = ?";
    private static final String UPDATE_UNCLAIMPARCELS_SQL = "UPDATE unclaimparcels SET batchID = ?, parcelNo = ?, parcelID = ?, studID = ? WHERE batchID = ?";

    public UnclaimParcelDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUnclaimParcel(UnclaimParcel unclaimParcel) throws SQLException {
        System.out.println(INSERT_UNCLAIMPARCELS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_UNCLAIMPARCELS_SQL)) {
            preparedStatement.setString(1, unclaimParcel.getParcelNo());
            preparedStatement.setString(2, unclaimParcel.getParcelID());
            preparedStatement.setString(3, unclaimParcel.getStudID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public UnclaimParcel selectUnclaimParcel(int batchID) {
        UnclaimParcel unclaimParcel = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_UNCLAIMPARCEL_BY_BATCHID)) {
            preparedStatement.setInt(1, batchID);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                String parcelNo = rs.getString("parcelNo");
                String parcelID = rs.getString("parcelID");
                String studID = rs.getString("studID");
                unclaimParcel = new UnclaimParcel(batchID, parcelID, parcelNo, studID);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return unclaimParcel;
    }

    public List<UnclaimParcel> getAllUnclaimParcels() {
        List<UnclaimParcel> unclaimParcels = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_UNCLAIMPARCELS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int batchID = rs.getInt("batchID");
                String parcelNo = rs.getString("parcelNo");
                String parcelID = rs.getString("parcelID");
                String studID = rs.getString("studID");
                unclaimParcels.add(new UnclaimParcel(batchID, parcelNo, parcelID, studID));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return unclaimParcels;
    }

    public boolean deleteUnclaimParcel(int batchID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_UNCLAIMPARCELS_SQL)) {
            statement.setInt(1, batchID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean updateUnclaimParcel(UnclaimParcel unclaimParcel) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_UNCLAIMPARCELS_SQL)) {
            statement.setString(1, unclaimParcel.getParcelNo());
            statement.setString(2, unclaimParcel.getParcelID());
            statement.setString(3, unclaimParcel.getStudID());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}