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

    public void guardar(BObjetos object) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "INSERT INTO objeto (nombre, efectoUso,peso) VALUES (?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, object.getNombre());
            pstmt.setString(2,object.getEfectoUso());
            pstmt.setFloat(3,object.getPeso());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void deleteObject(String objectID) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "DELETE FROM objeto WHERE idObjeto = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, objectID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public BObjetos getObjectbyId(String id) {
        BObjetos object = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";


        String sql = "select * from objeto WHERE idObjeto = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    object = new BObjetos();
                    object.setIdObjeto(rs.getInt(1));
                    object.setNombre(rs.getString(2));
                    object.setEfectoUso(rs.getString(3));
                    object.setPeso(rs.getFloat(4));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return object;
    }

    public void updateObject(int id, String nombre, String efecto, float peso) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "UPDATE objeto SET nombre = ?, efectoUso = ?, peso = ? WHERE idObjeto = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1,nombre);
            pstmt.setString(2,efecto);
            pstmt.setString(3,efecto);
            pstmt.setFloat(3,peso);
            pstmt.setInt(4,id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<BObjetos> searchByName(String nombre) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        ArrayList<BObjetos> lista = new ArrayList<>();
        String sql = "select * from objeto where nombre = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, nombre);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BObjetos object = new BObjetos();
                    object.setIdObjeto(rs.getInt(1));
                    object.setNombre(rs.getString(2));
                    object.setEfectoUso(rs.getString(3));
                    object.setPeso(rs.getFloat(4));
                    lista.add(object);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }
    public boolean validarNombre(String nombre){
        boolean valid = true;
        ArrayList<BObjetos> lista = getObjectList();
        for(BObjetos objeto : lista){
            if(nombre.equalsIgnoreCase(objeto.getNombre())){
                valid = false;
            }
        }
        return  valid;
    }


}