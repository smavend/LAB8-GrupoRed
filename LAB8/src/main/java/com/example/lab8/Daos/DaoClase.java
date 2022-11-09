package com.example.lab8.Daos;

import com.example.lab8.Beans.Clase;
import com.example.lab8.Beans.ElementoClase;
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
    public ArrayList<ElementoClase> obtenerElementos(int idClase){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT idElemento, porcDano FROM elementodeclase WHERE idClase = ?";
        ArrayList<ElementoClase> lista = new ArrayList<>();
        ElementoClase elementoClase = null;

        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idClase);

            try (ResultSet rs = pstmt.executeQuery()){
                while (rs.next()){
                    elementoClase = new ElementoClase();
                    elementoClase.setIdElemento(rs.getInt(1));
                    elementoClase.setPorcDano(rs.getInt(2));
                    elementoClase.setFortDeb((rs.getInt(2)>100)?"Fortaleza":(rs.getInt(2)<100)?"Debilidad":"-");
                    lista.add(elementoClase);
                }
            }
        }
        catch (SQLException e){
            throw new RuntimeException();
        }
        return lista;
    }
    public String elementoBuscarNombreConId(int idElemento){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT nombre FROM grupored.elemento where idElemento = ?";
        String nombre = null;

        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idElemento);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    nombre = rs.getString(1);
                }
                else{
                    nombre = "No existe";
                }
            }
        }
        catch (SQLException e){
            throw new RuntimeException();
        }
        return nombre;
    }
    public int hallarPorcentaje(int idClase, int idElemento){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT porcDano FROM elementodeclase where idClase = ? and idElemento = ?";
        int porcentaje = 100;

        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idClase);
            pstmt.setInt(2, idElemento);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    porcentaje = rs.getInt(1);
                }
            }
        }
        catch (SQLException e){
            throw new RuntimeException();
        }
        return porcentaje;
    }
}
