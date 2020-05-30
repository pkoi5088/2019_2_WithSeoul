package beans;

import java.sql.*;

public class Javabeans {
	private Connection conn = null;
	private Statement stmt = null;
	private String sql = null;
	private ResultSet rs = null;

	public Javabeans() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://1.234.19.85:8306/with_seoul_db?serverTimezone=UTC&autoReconnect=true";
			conn = DriverManager.getConnection(jdbcurl, "admin", "!Q@W#E$R");
			stmt = conn.createStatement();
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(Javabeans) : " + e.getMessage());
		}
	}

	public ResultSet executeQuery(String sql) {
		try {
			return stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(executeQuery) : " + e.getMessage());
			return null;
		}
	}

	public int executeUpdate(String sql) {
		try {
			return stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(executeUpdate) : " + e.getMessage());
			return -1;
		}
	}

	public void close() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(close) : " + e.getMessage());
		}
	}

	public boolean check(String id, String password) {
		try {
			rs = stmt.executeQuery("select * from user_tbl where id = '" + id + "' and password = '" + password + "'");
			if (rs.next())
				return true;
			return false;
		} catch (SQLException e) {
			System.out.println("DB 연동 오류 in Javabeans(check) : " + e.getMessage());
		}
		return false;
	}

	public boolean checkId(String id) {
		try {
			rs = stmt.executeQuery("select * from user_tbl where id = '" + id + "'");
			if (rs.next())
				return true;
			return false;
		} catch (SQLException e) {
			System.out.println("DB 연동 오류 in Javabeans(checkId) : " + e.getMessage());
		}
		return false;
	}

	public String getNick(String id) {
		try {
			rs = stmt.executeQuery("select * from user_tbl where id = '" + id + "'");
			if (rs.next())
				return rs.getString("nickname");
			return null;
		} catch (SQLException e) {
			System.out.println("DB 연동 오류 in Javabeans(getNick) : " + e.getMessage());
		}
		return null;
	}

	public boolean register(String[] info) {
		// 0~5 : Name ID PassWord phone E-Mail NickName
		try {
			if (this.executeUpdate("insert into user_tbl values('" + info[1] + "', '" + info[2] + "'," + "'" + info[0]
					+ "', '" + info[3] + "', '" + info[4] + "', '" + info[5] + "')") != -1) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(register) : " + e.getMessage());
		}
		return false;
	}

	public int getSize(String sql) {
		rs = this.executeQuery(sql);
		if (rs == null)
			return -1;
		try {
			if (rs.last())
				return rs.getRow();
			else
				return 0;
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(getSize) : " + e.getMessage());
		}
		return -1;
	}

	public int getLastNum() {
		ResultSet rs2 = this.executeQuery("select * from post_tbl");
		try {
			if (rs2.last())
				return rs2.getInt("num");
			return 0;
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(getLastNum) : " + e.getMessage());
		}
		return -1;
	}

	// info[0~4] age location title content
	public boolean postInsert(String[] theme, String[] info, String id) {
		int tour = 0, landmark = 0, art = 0, sports = 0;
		for (String str : theme) {
			if (str.equals("tour"))
				tour = 1;
			if (str.equals("landmark"))
				landmark = 1;
			if (str.equals("art"))
				art = 1;
			if (str.equals("sports"))
				sports = 1;
		}
		try {
			String name = this.getNick(id);
			int n = this.getLastNum();
			if (n == -1)
				return false;
			if (this.executeUpdate("insert into post_tbl values(0,'" + info[2] + "', '" + name + "'," + "'" + info[3]
					+ "', '" + info[1] + "', " + tour + ", " + landmark + ", " + art + ", " + sports + ", '" + info[0]
					+ "', " + (n + 1) + ",'"+info[4] +"')") != -1) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(postInsert) : " + e.getMessage());
			return false;
		}
		return false;
	}

	public boolean postDelete(String sql) {
		if (this.executeUpdate(sql) != -1)
			return true;
		return false;
	}

	public boolean declareInsert(String title, String content,String id) {
		try {
			int num = 0;
			ResultSet rs2 = this.executeQuery("select * from declare_tbl");
			if (rs2.last())
				num = rs2.getInt("num")+1;
			else
				num = 1;
			
			if (this.executeUpdate(
					"insert into declare_tbl values('" + title + "', '" + content + "', " + num + ", '0', '"+id+"')") != -1) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("DB 연동 오류 in Javabeans(declareInsert) : " + e.getMessage());
			return false;
		}
		return false;
	}

	public boolean Withdraw(String id) {
		if (this.executeUpdate("delete from user_tbl where id = '"+id+"'") != -1)
			return true;
		return false;
	}
}
