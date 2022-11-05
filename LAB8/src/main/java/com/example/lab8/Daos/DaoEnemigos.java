package com.example.lab8.Daos;

import com.example.lab8.Beans.Enemigo;
import com.example.lab8.Beans.Objeto;

import java.sql.*;
import java.util.ArrayList;

public class DaoEnemigos {
    public ArrayList<Enemigo> listarEnemigos() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Enemigo> lista = new ArrayList<>();
        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT e.nombre, c.nombre, ataque, experiencia, o.nombre, probObjeto, genero, e.idEnemigo, c.idClase, e.idObjeto" +
                " FROM enemigo e, clase c, objeto o " +
                "WHERE e.idClase = c.idClase and e.idObjeto=o.idObjeto";
        try (Connection connection = DriverManager.getConnection(url, user, pasw);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            Enemigo enemigo;
            while (rs.next()) {
                enemigo = new Enemigo();
                enemigo.setNombre(rs.getString(1));
                enemigo.setClase(rs.getString(2));
                enemigo.setAtaque(rs.getInt(3));
                enemigo.setExperiencia(rs.getInt(4));
                enemigo.setObjetoDado(rs.getString(5));
                enemigo.setProbObjeto(rs.getFloat(6));
                enemigo.setGenero(rs.getString(7));
                enemigo.setIdEnemigo(rs.getInt(8));
                enemigo.setIdClase(rs.getInt(9));
                enemigo.setIdObjeto(rs.getInt(10));

                lista.add(enemigo);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException();
        }
        return lista;
    }

    public Enemigo buscarId(String idEnemigo){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT e.nombre, c.nombre, ataque, experiencia, o.nombre, probObjeto, genero, e.idEnemigo, c.idClase, e.idObjeto" +
                " FROM enemigo e, clase c, objeto o " +
                "WHERE e.idClase = c.idClase and e.idObjeto=o.idObjeto and e.idEnemigo = ?";
        Enemigo enemigo = null;

        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idEnemigo);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    enemigo = new Enemigo();

                    enemigo.setNombre(rs.getString(1));
                    enemigo.setClase(rs.getString(2));
                    enemigo.setAtaque(rs.getInt(3));
                    enemigo.setExperiencia(rs.getInt(4));
                    enemigo.setObjetoDado(rs.getString(5));
                    enemigo.setProbObjeto(rs.getFloat(6));
                    enemigo.setGenero(rs.getString(7));
                    enemigo.setIdEnemigo(rs.getInt(8));
                    enemigo.setIdClase(rs.getInt(9));
                    enemigo.setIdObjeto(rs.getInt(10));
                }
            }

        }
        catch (SQLException e){
            throw new RuntimeException();
        }
        return enemigo;
    }

    public boolean editar(int idEnemigo, String nombre, int clase, int ataque, int experiencia, int objeto, float probObjeto, String genero){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "UPDATE enemigo SET nombre = ?, idClase = ?, ataque = ?, experiencia = ?, idObjeto = ?, probObjeto=?, genero = ? WHERE idEnemigo = ?";
        Enemigo enemigo;

        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setInt(2,clase);
            pstmt.setInt(3, ataque);
            pstmt.setInt(4,experiencia);
            pstmt.setInt(5,objeto);
            pstmt.setFloat(6,probObjeto);
            pstmt.setString(7,(genero.equals("")?null:genero));
            pstmt.setInt(8,idEnemigo);

            pstmt.executeUpdate();
            return true;
        }
        catch (SQLException e){
            return false;
        }
    }
}
