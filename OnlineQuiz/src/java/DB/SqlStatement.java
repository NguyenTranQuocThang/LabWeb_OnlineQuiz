/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import Model.Quiz;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author thang
 */
public class SqlStatement {

    DBContext dbc = new DBContext();
    // getListUser for check password and account
    public ArrayList<User> getListUser() throws Exception {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT [UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[UserType]\n"
                + "      ,[Email]\n"
                + "  FROM [dbo].[Account]";
        try {
            cnn = dbc.getConnection();
            ps = cnn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("UserName"));
                user.setPassWord(rs.getString("PassWord"));
                user.setUserType(rs.getString("UserType"));
                user.setEmail(rs.getString("Email"));
                userList.add(user);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            dbc.closeConnection(rs, ps, cnn);
        }
        return userList;
    }
    // register Account
    public void Register(String username, String password, String usertype, String email) throws Exception {
        Connection cnn = null;
        PreparedStatement ss = null;
        ResultSet rs;
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([UserName]\n"
                + "           ,[PassWord]\n"
                + "           ,[UserType]\n"
                + "           ,[Email])\n"
                + "     VALUES(?,?,?,?)";
        try {
            cnn = dbc.getConnection();
            ss = cnn.prepareStatement(sql);
            ss.setString(1, username);
            ss.setString(2, password);
            ss.setString(3, usertype);
            ss.setString(4, email);
            ss.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            dbc.closeConnection(ss, cnn);
        }
    }
     
    
    // addQuestion to database
    public void AddQuestion(String question, String option1, String option2, String option3, String option4, String answer) throws Exception {
        Connection cnn = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO [dbo].[Quiz]\n"
                + "           ([Question]\n"
                + "           ,[Option1]\n"
                + "           ,[Option2]\n"
                + "           ,[Option3]\n"
                + "           ,[Option4]\n"
                + "           ,[Answer]\n"
                + "           ,[DateCreated])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,GetDate())";
        try {
            cnn = dbc.getConnection();
            ps = cnn.prepareStatement(sql);
            ps.setString(1, question);
            ps.setString(2, option1);
            ps.setString(3, option2);
            ps.setString(4, option3);
            ps.setString(5, option4);
            ps.setString(6, answer);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            dbc.closeConnection(ps, cnn);
        }
    }

//    public int checkQuestion(String question) throws Exception {
//        Connection cnn = null;
//        PreparedStatement ss = null;
//        ResultSet rs = null;
//        String sql = "SELECT Count (*) as row \n"
//                + "  FROM [dbo].[Quiz] where Question = ?";
//        try {
//            cnn = dbc.getConnection();
//            ss = cnn.prepareStatement(sql);
//            ss.setString(1, question);
//            rs = ss.executeQuery();
//            rs.next();
//            return rs.getInt("row");
//        } catch (Exception e) {
//            throw e;
//        } finally {
//            dbc.closeConnection(rs, ss, cnn);
//        }
//    }
    
    //GetQuestion in database with paging // with pageindex = pagenow , pagesize = sum page
    public ArrayList getQuestionToManage(int pageindex, int pagesize) throws Exception {
        Connection cnn = null;
        PreparedStatement ss = null;
        ResultSet rs = null;
        ArrayList<Quiz> quizs = new ArrayList<>();
        String sqlF = "Select *,ROW_NUMBER() over (ORDER BY ID ASC) as row_num from Quiz";
        String sql = "Select * from (" + sqlF + ") Quiz where row_num >= (?-1)*?+1 and row_num <= ? * ? ";
        try {
            cnn = dbc.getConnection();
            ss = cnn.prepareStatement(sql);
            ss.setInt(1, pageindex);
            ss.setInt(2, pagesize);
            ss.setInt(3, pageindex);
            ss.setInt(4, pagesize);
            rs = ss.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt("ID"));
                quiz.setQuestion(rs.getString("Question"));
                quiz.setOption1(rs.getString("Option1"));
                quiz.setOption2(rs.getString("Option2"));
                quiz.setOption3(rs.getString("Option3"));
                quiz.setOption4(rs.getString("Option4"));
                quiz.setAnswer(rs.getString("Answer"));
                quiz.setDateCreated(rs.getDate("DateCreated"));
                quizs.add(quiz);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            dbc.closeConnection(rs, ss, cnn);
        }
        return quizs;
    }
    // countQuestion to check access and paging
    public int countQuestion() throws Exception {
        Connection cnn = null;
        PreparedStatement ss = null;
        ResultSet rs = null;
        String sql = "select count(*) as rownum from Quiz";
        try {
            cnn = dbc.getConnection();
            ss = cnn.prepareStatement(sql);
            rs = ss.executeQuery();
            rs.next();
            return rs.getInt("rownum");
        } catch (Exception e) {
            throw e;
        } finally {
            dbc.closeConnection(rs, ss, cnn);
        }
    }
    // remove quez by id
    public void removeQuiz(int idQuestion) throws Exception {
        Connection cnn = null;
        PreparedStatement ss = null;
        String sql = "DELETE FROM [dbo].[Quiz]\n"
                + "      WHERE ID = ? ";
        try {
            cnn = dbc.getConnection();
            ss = cnn.prepareStatement(sql);
            ss.setInt(1, idQuestion);
            ss.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            dbc.closeConnection(ss, cnn);
        }
    }

 
    // getList Quiz random
    public ArrayList<Quiz> getListQuiz(int numberQuestion) throws Exception {
        ArrayList<Quiz> quizList = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT TOP (?) [ID]\n"
                + "      ,[Question]\n"
                + "      ,[Option1]\n"
                + "      ,[Option2]\n"
                + "      ,[Option3]\n"
                + "      ,[Option4]\n"
                + "      ,[Answer]\n"
                + "      ,[DateCreated]\n"
                + "  FROM [OnlineQuiz].[dbo].[Quiz]\n"
                + "  ORDER BY NEWID()  ";
        try {
            cnn = dbc.getConnection();
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, numberQuestion);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setId(rs.getInt("ID"));
                quiz.setQuestion(rs.getString("Question"));
                quiz.setOption1(rs.getString("Option1"));
                quiz.setOption2(rs.getString("Option2"));
                quiz.setOption3(rs.getString("Option3"));
                quiz.setOption4(rs.getString("Option4"));
                quiz.setAnswer(rs.getString("Answer"));
                quiz.setDateCreated(rs.getDate("DateCreated"));
                quizList.add(quiz);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            dbc.closeConnection(rs, ps, cnn);
        }
        return quizList;
    }
}
