package com.example.lab8.Daos;

import com.example.lab8.Beans.Hechizo;

import java.sql.*;
import java.util.ArrayList;

public class DaosHechizos {

    public ArrayList<Hechizo> getHechizoList() {
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

}
