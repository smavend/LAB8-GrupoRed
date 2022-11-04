package com.example.lab8.Daos;

import com.example.lab8.Beans.BObjetos;

import java.sql.*;
import java.util.ArrayList;

public class DaoObjetos {
    public ArrayList<BObjetos> getObjectList() {
        ArrayList<BObjetos> objectList = new ArrayList<>();
        try {
            String user = "root";
            String passw = "root";
            String url = "jdbc:mysql://localhost:3306/grupored";
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url, user, passw);
            Statement statement = connection.createStatement();
            String sql = "select * from objeto";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                BObjetos newObject = new BObjetos();
                newObject.setIdObjeto(resultSet.getInt(1));
                newObject.setNombre(resultSet.getString(2));
                newObject.setEfectoUso(resultSet.getString(3));
                newObject.setPeso(resultSet.getFloat(4));

                objectList.add(newObject);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return objectList;
    }
}
