/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package observatory;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Jaime
 */
public class DatabaseManager {

    Connection connection = null;
    boolean isValid = true;

    public void executeUpdate(String Query) throws SQLException {
        Statement stmt;
        ResultSet rs = null;
        //Connect to MySql Database
        String connectionURL = "jdbc:mysql://localhost/Observatory";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "");
            stmt = connection.createStatement();
            stmt.executeUpdate(Query);
            if (!connection.isClosed()) {
                // out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } finally {
        }

    }

    public ResultSet executeQuery(String Query) throws SQLException {
        Statement stmt;
        ResultSet rs = null;
        //Connect to MySql Database
        String connectionURL = "jdbc:mysql://localhost/Observatory";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "");
            stmt = connection.createStatement();
            rs = stmt.executeQuery(Query);
            if (!connection.isClosed()) {
                // out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } finally {
        }

        return rs;
    }

    public void submitProposal(String Querey) throws IllegalAccessException, SQLException, ClassNotFoundException, InstantiationException {

        String connectionURL = "jdbc:mysql://localhost/Observatory";

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "");
        Statement statement = connection.prepareStatement(Querey,
                Statement.RETURN_GENERATED_KEYS);
        int affectedRows = statement.executeUpdate(Querey);

        if (affectedRows == 0) {
            throw new SQLException("Creating proposal failed, no rows affected.");
        }

        ResultSet generatedKeys = statement.getGeneratedKeys();
        if (generatedKeys.next()) {
            int id = generatedKeys.getInt(1);
        } else {
            throw new SQLException("Creating proposal failed, no ID obtained.");
        }
    }

    public void setValidity(boolean valid) {
        this.isValid = valid;
    }

    public boolean getValidity() {
        return isValid;
    }

    public Connection establishCxn() {
        String connectionURL = "jdbc:mysql://localhost/Observatory";
        connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "");

            if (!connection.isClosed()) {
                // out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } finally {
        }

        return connection;
    }

    public void closeCxn() throws SQLException {
        connection.close();
    }

    public ResultSet selectAllUsersQuery() throws SQLException {

        ResultSet rs = null;
        String selectSQL = "SELECT * FROM users ORDER BY section";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            rs = preparedStatement.executeQuery();
       // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

        return rs;
    }

    public ResultSet selectAllTempUsersQuery() throws SQLException {
        ResultSet rs = null;
        String selectSQL = "SELECT * FROM tempusers ORDER BY section";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            rs = preparedStatement.executeQuery();
            // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

        return rs;
    }

    public ResultSet selectSpecificTempUserQuery(String tempUser) throws SQLException {

        ResultSet rs = null;
        String selectSQL = "SELECT * FROM tempusers WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            preparedStatement.setString(1, tempUser);
            rs = preparedStatement.executeQuery();
       // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
        return rs;
    }

    public void deleteSpecificTempUserQuery(String tempUser) {
        String deleteSQL = "DELETE FROM tempusers WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(deleteSQL);
            preparedStatement.setString(1, tempUser);
            preparedStatement.executeUpdate();
            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    public void InsertIntoUsersQuery(String email, String firstName, String lastName, String password, String salt, String eID, String universityID, String section, int priority, String dateCreated, boolean schedulingPermission, boolean adminPermission) {
        String insertSQL = "INSERT INTO users (email, firstName, lastName, password, salt, eID, universityID, section, priority, dateCreated, schedulingPermission, adminPermission) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            PreparedStatement preparedStatement = establishCxn().prepareStatement(insertSQL);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, firstName);
            preparedStatement.setString(3, lastName);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, salt);
            preparedStatement.setString(6, eID);
            preparedStatement.setString(7, universityID);
            preparedStatement.setString(8, section);
            preparedStatement.setInt(9, priority);
            preparedStatement.setString(10, dateCreated);
            preparedStatement.setBoolean(11, schedulingPermission);
            preparedStatement.setBoolean(12, adminPermission);

            preparedStatement.executeUpdate();

            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }
    
     public void InsertIntoTempUsersQuery(String email, String firstName, String lastName, String password, String salt, String eID, String universityID, String section, int priority, String dateCreated, boolean schedulingPermission, boolean adminPermission) {
        String insertSQL = "INSERT INTO tempusers (email, firstName, lastName, password, salt, eID, universityID, section, priority, dateCreated, schedulingPermission, adminPermission) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            PreparedStatement preparedStatement = establishCxn().prepareStatement(insertSQL);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, firstName);
            preparedStatement.setString(3, lastName);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, salt);
            preparedStatement.setString(6, eID);
            preparedStatement.setString(7, universityID);
            preparedStatement.setString(8, section);
            preparedStatement.setInt(9, priority);
            preparedStatement.setString(10, dateCreated);
            preparedStatement.setBoolean(11, schedulingPermission);
            preparedStatement.setBoolean(12, adminPermission);

            preparedStatement.executeUpdate();

            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    public ResultSet selectSpecificUserQuery(String user) {
        ResultSet rs = null;
        String selectSQL = "SELECT * FROM users WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            preparedStatement.setString(1, user);
            rs = preparedStatement.executeQuery();
       // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
        return rs;
    }

    public void deleteSpecificUserQuery(String user) {
        String deleteSQL = "DELETE FROM users WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(deleteSQL);
            preparedStatement.setString(1, user);
            preparedStatement.executeUpdate();
            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    public void updateSpecificUserSchedulingPermissionQuery(String user, boolean update) {
        String updateSQL = "UPDATE users SET schedulingPermission = ? WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(updateSQL);
            preparedStatement.setBoolean(1, update);
            preparedStatement.setString(2, user);
            preparedStatement.executeUpdate();
            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    public void updateSpecificUserAdminPermissionQuery(String user, boolean update) {
        String updateSQL = "UPDATE users SET adminPermission = ? WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(updateSQL);
            preparedStatement.setBoolean(1, update);
            preparedStatement.setString(2, user);
            preparedStatement.executeUpdate();
            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

    }

    public void InsertIntoParamsQuery(String target,
            String id, String ra, String dc,
            String angle, String repeat, String frame, String filter, String exposure,
            String binning, String count) {
        Statement stmt;
        //Connect to MySql Database
        String connectionURL = "jdbc:mysql://localhost/Observatory";
        SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd/YYYY");//dd/MM/yyyy
        Date now = new Date();
        String strDate = sdfDate.format(now);
        String insertSQL = "INSERT INTO `observatory`.`params` (`requestID`, `STARTDATE`, `STARTTIME`, `TARGET`, `ID`, `RA`, `DC`, `ANGLE`, `REPEAT`, `FRAME`, `FILTER`, `EXPOSURE`, `BINNING`, `COUNT`) "
                + "VALUES ( NULL, '" + strDate + "','NOTSET', '" + target + "', '" + id + "', '" + ra + "', '" + dc + "', '" + angle + "', '" + repeat + "', '" + frame + "', '"
                + filter + "', '" + exposure + "', '" + binning + "', '" + count + "')";
        System.out.print(insertSQL);
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "");
            stmt = connection.createStatement();
            stmt.executeUpdate(insertSQL);
            if (!connection.isClosed()) {
                // out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } finally {
        }

    }

    public ResultSet selectAllObservationsQuery() throws SQLException {
        ResultSet rs = null;
        String selectSQL = "SELECT * FROM params ORDER BY requestID";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            rs = preparedStatement.executeQuery();
            // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

        return rs;
    }

    

    public ResultSet selectSpecificProposalQuery(String proposal) {
        ResultSet rs = null;
        String selectSQL = "SELECT * FROM params WHERE requestID = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            preparedStatement.setString(1, proposal);
            rs = preparedStatement.executeQuery();
       // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
        return rs;
    }

    public void deleteSpecificProposalQuery(String requestID) {
        String deleteSQL = "DELETE FROM params WHERE requestID = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(deleteSQL);
            preparedStatement.setString(1, requestID);
            preparedStatement.executeUpdate();
            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

    public ResultSet checkSchedlingPermissionQuery(String email) throws SQLException {
        ResultSet rs = null;
        String selectSQL = "SELECT shedulingPermission FROM users WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            rs = preparedStatement.executeQuery();
            // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

        return rs;
    }

    public ResultSet checkAdminPermissionQuery(String email) throws SQLException {
        ResultSet rs = null;
        String selectSQL = "SELECT adminPermission FROM users WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            rs = preparedStatement.executeQuery();
            // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

        return rs;
    }

    public void InsertIntoObservationsQuery(String username, String email, String imagetype, String requestID, String location) {
        String insertSQL = "INSERT INTO observations (username, email, imageType, requestID, pictureLoc) VALUES(?, ?, ?, ?, ?)";
        try {

            PreparedStatement preparedStatement = establishCxn().prepareStatement(insertSQL);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, imagetype);
            preparedStatement.setString(4, requestID);
            preparedStatement.setString(5, location);

            preparedStatement.executeUpdate();

            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }
    
     public ResultSet selectAllUserPicturesQuery(String email) throws SQLException {
        ResultSet rs = null;
        String selectSQL = "SELECT * FROM observations WHERE email = ? ORDER BY requestID";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            rs = preparedStatement.executeQuery();
            // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

        return rs;
    }
     
     public ResultSet selectUserForRecoveryQuery(String email, String fname, String lname, String univID) throws SQLException {
        ResultSet rs = null;
        String selectSQL = "SELECT * FROM users WHERE email = ? AND firstName = ? AND lastName = ? AND universityID = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, fname);
            preparedStatement.setString(3, lname);
            preparedStatement.setString(4, univID);
            
            rs = preparedStatement.executeQuery();
            // closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }

        return rs;
    }
     
     public void updatePasswordQuery(String password, String email) {
        String updateSQL = "UPDATE users SET password = ? WHERE email = ?";

        try {
            PreparedStatement preparedStatement = establishCxn().prepareStatement(updateSQL);
            preparedStatement.setString(1, password);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();
            closeCxn();

        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }

}
