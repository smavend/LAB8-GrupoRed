package com.example.lab8.Daos;

import com.example.lab8.Beans.Hechizo;

import java.sql.*;
import java.util.ArrayList;

public class DaosHechizos {

    public ArrayList<Hechizo> obtenerListaHechizos() {
        ArrayList<Hechizo> HechizoList = new ArrayList<>();
        try {
            String user = "root";
            String passw = "root";
            String url = "jdbc:mysql://localhost:3306/grupored";
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url, user, passw);
            Statement statement = connection.createStatement();
            String sql = "select * from hechizo";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Hechizo newHechizo = new Hechizo();
                newHechizo.setIdHechizo(resultSet.getInt(1));
                newHechizo.setNombreHechizo(resultSet.getString(2));
                newHechizo.setPotencia(resultSet.getInt(3));
                newHechizo.setPrecision(resultSet.getInt(4));
                newHechizo.setNivelDeAprendizaje(resultSet.getInt(5));
                newHechizo.setElementoRelacionado(resultSet.getInt(6));
                newHechizo.setHechizoBase(resultSet.getInt(7));

                HechizoList.add(newHechizo);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return HechizoList;
    }

    public void borrarHechizo(String hechizoID) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "DELETE FROM objeto WHERE idHechizo = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, hechizoID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Hechizo obtenerHechizo(String hechizoID){
        Hechizo hechizo = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "select * from heroe WHERE idHechizo = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, Integer.parseInt(hechizoID));

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    hechizo = new Hechizo();
                    hechizo.setIdHechizo(rs.getInt(1));
                    hechizo.setNombreHechizo(rs.getString(2));
                    hechizo.setPotencia(rs.getInt(3));
                    hechizo.setPrecision(rs.getInt(4));
                    hechizo.setNivelDeAprendizaje(rs.getInt(5));
                    hechizo.setElementoRelacionado(rs.getInt(6));
                    hechizo.setHechizoBase(rs.getInt(7));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hechizo;

    }


}
