package com.example.lab8.Daos;

import com.example.lab8.Beans.Clase;
import com.example.lab8.Beans.Enemigo;

import java.sql.*;
import java.util.ArrayList;

public class DaoClase {
    public ArrayList<Clase> listarClases(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Clase> lista = new ArrayList<>();
        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT * FROM clase";
        try (Connection connection = DriverManager.getConnection(url, user, pasw);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            Clase clase;
            while (rs.next()) {
                clase = new Clase();
                clase.setIdClase(rs.getInt(1));
                clase.setNombre(rs.getString(2));

                lista.add(clase);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException();
        }
        return lista;
    }
    public String buscarNombreXId(int idClase){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT nombre FROM clase WHERE idClase = ?";
        String nombre = null;

        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idClase);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    nombre = rs.getString(1);
                }
            }
        }
        catch (SQLException e){
            throw new RuntimeException();
        }
        return nombre;
    }
}
