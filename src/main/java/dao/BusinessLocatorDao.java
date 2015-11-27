package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Company;

public class BusinessLocatorDao {

	public ArrayList<Company> getNabours(double latitude, double longitude) {
		ArrayList<Company> companies = new ArrayList<Company>();
		Connection connection = null;
		String query = "select company.company_text, address.latitude, address.longitude FROM company_address LEFT JOIN company ON company_address.ca_company_id = company.company_id LEFT JOIN address ON company_address.ca_address_id = address.address_id where abs(?-address.longitude) <= 0.05 and abs(?-address.latitude) <= 0.015;";
		PreparedStatement pstmt = null;
		try {
			connection = DBConnect.getConnection();
		} catch (Exception e) {
			System.err.println("There was an error getting the connection");
		}
		try {
			connection.setAutoCommit(false);
			System.err.println("The autocommit was disabled!");
		} catch (SQLException e) {
			System.err.println("There was an error disabling autocommit");
		}
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setDouble(2, longitude);
			pstmt.setDouble(1, latitude);
			ResultSet rs = pstmt.executeQuery();
			if (!(!rs.isBeforeFirst() && rs.getRow() == 0)) {
				while (rs.next()) {
					Company company = new Company();
					company.setLatitude(rs.getDouble("latitude"));
					company.setLongitude(rs.getDouble("longitude"));
					company.setName(rs.getString("company_text"));
					companies.add(company);
				}
			}
		} catch (SQLException e) {
			System.err.println("There was an error getting data from the database.");
			e.printStackTrace();
		}
		return companies;
	}
}
