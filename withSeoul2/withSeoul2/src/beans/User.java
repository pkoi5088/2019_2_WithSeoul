package beans;

import java.sql.*;

public class User {
   private String name = null;
   private String phone = null;
   private String e_mail = null;
   private String nick = null;
   
   public User() {
   }
   
   public void setUser(Javabeans db, String id) {
      ResultSet rs = db.executeQuery("select name, phone, e_mail, nickname from user_tbl where id = '"+id+"'");
      try {
         if(rs.next()) {
            name = rs.getString("name");
            phone = rs.getString("phone");
            e_mail = rs.getString("e_mail");
            nick = rs.getString("nickname");
         }
      } catch (SQLException e) {
         System.out.println("DB 연동 오류 in Javabeans(setUser) : " + e.getMessage());
      }
   }

   public String getName() {
      return name;
   }

   public String getPhone() {
      return phone;
   }

   public String getMail() {
      return e_mail;
   }

   public String getNick() {
      return nick;
   }
}