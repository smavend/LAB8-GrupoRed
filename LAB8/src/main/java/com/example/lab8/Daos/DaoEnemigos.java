package com.example.lab8.Daos;

import com.example.lab8.Beans.Enemigo;
import com.example.lab8.Beans.Estadistica;
import com.example.lab8.Beans.Heroes;
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
                enemigo.setGenero((rs.getString(7)==null)?"-":rs.getString(7));
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

    public boolean editar(Enemigo enemigo){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "UPDATE enemigo SET nombre = ?, idClase = ?, ataque = ?, experiencia = ?, idObjeto = ?, probObjeto=?, genero = ? WHERE idEnemigo = ?";


        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, enemigo.getNombre());
            pstmt.setInt(2,enemigo.getIdClase());
            pstmt.setInt(3, enemigo.getAtaque());
            pstmt.setInt(4,enemigo.getExperiencia());
            pstmt.setInt(5,enemigo.getIdObjeto());
            pstmt.setFloat(6,enemigo.getProbObjeto());

            pstmt.setString(7,enemigo.getGenero());
            pstmt.setInt(8,enemigo.getIdEnemigo());

            pstmt.executeUpdate();
            return true;
        }
        catch (SQLException e){
            return false;
        }
    }

    public boolean agregar(Enemigo enemigo){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "INSERT INTO enemigo (nombre, idClase, ataque, experiencia, idObjeto, probObjeto, genero) VALUES (?,?,?,?,?,?,?)";


        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, enemigo.getNombre());
            pstmt.setInt(2,enemigo.getIdClase());
            pstmt.setInt(3, enemigo.getAtaque());
            pstmt.setInt(4,enemigo.getExperiencia());
            pstmt.setInt(5,enemigo.getIdObjeto());
            pstmt.setFloat(6,enemigo.getProbObjeto());
            pstmt.setString(7,enemigo.getGenero());

            pstmt.executeUpdate();
            return true;
        }
        catch (SQLException e){
            return false;
        }
    }

    public boolean borrar(int idEnemigo){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "DELETE FROM enemigo WHERE idEnemigo = ?";


        try(Connection conn = DriverManager.getConnection(url, user, pasw);
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idEnemigo);

            pstmt.executeUpdate();
            return true;
        }
        catch (SQLException e){
            return false;
        }
    }
/*
    public Estadistica obtenerEstad (){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT idClase, max(contador), sum(contador) FROM (SELECT idClase, count(idClase) contador FROM enemigo GROUP BY idClase) subQuery";
        DaoClase daoClase = new DaoClase();
        Estadistica estadistica = new Estadistica();

        try(Connection connection = DriverManager.getConnection(url, user, pasw);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);) {

            int idClase = rs.getInt(1);
            String clase = daoClase.buscarNombreXId(idClase);
            estadistica.setClase((clase==null)?"Ninguna clase":clase);
            estadistica.setPorcClase((clase.equals("Ninguna clase")?(float)0.0:100 * rs.getInt(2)/ rs.getInt(3)));
        }
        catch (SQLException e){
            throw new RuntimeException();
        }
        return estadistica;
    }
    */

    public Estadistica obtenerEstadClase() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Estadistica estadistica = new Estadistica();
        DaoClase daoClase = new DaoClase();
        DaoObjetos daoObjetos = new DaoObjetos();
        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT idClase, max(contador), sum(contador) FROM (SELECT idClase, count(idClase) contador FROM enemigo GROUP BY idClase) subQuery";
        try (Connection connection = DriverManager.getConnection(url, user, pasw);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()){
                String nombre = (daoClase.buscarNombreXId(rs.getInt(1))==null)?"Sin clase": daoClase.buscarNombreXId(rs.getInt(1));
                estadistica.setClase(nombre);
                float porcentaje = (nombre.equals("Sin clase"))?0.0f:Math.round((1000f*rs.getInt(2))/rs.getInt(3))/10f;
                estadistica.setPorcClase(porcentaje);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException();
        }
        return estadistica;
    }
    public Estadistica obtenerEstadObjeto(Estadistica previo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        DaoObjetos daoObjetos = new DaoObjetos();
        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "SELECT idObjeto, max(contador), sum(contador) FROM (SELECT idObjeto, count(idObjeto) contador FROM enemigo " +
                "GROUP BY idObjeto) subQuery1";
        try (Connection connection = DriverManager.getConnection(url, user, pasw);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()){
                Objeto objeto = daoObjetos.getObjectbyId(""+rs.getInt(1)+"");
                String nombre = (objeto.getNombre()==null)?"Sin objeto": objeto.getNombre();
                previo.setObjeto(nombre);
                float porcentaje = (nombre.equals("Sin objeto"))?0.0f:Math.round((1000f*rs.getInt(2))/rs.getInt(3))/10f;
                previo.setPorcObjeto(porcentaje);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException();
        }
        return previo;
    }
    public Estadistica obtenerEstadGenero(Estadistica previo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String user = "root";
        String pasw = "root";
        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "Select count(*), (select count(*) from enemigo) from enemigo WHERE genero = '-' GROUP BY genero";
        try (Connection connection = DriverManager.getConnection(url, user, pasw);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()){
                float porcentaje = Math.round((1000f*rs.getInt(1))/rs.getInt(2))/10f;
                previo.setPorcGenero(porcentaje);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException();
        }
        return previo;
    }
    public ArrayList<Enemigo> buscarNombre(String nombre) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";

        ArrayList<Enemigo> lista = new ArrayList<>();
        Enemigo enemigo = null;
        String sql = "SELECT e.nombre, c.nombre, ataque, experiencia, o.nombre, probObjeto, genero, e.idEnemigo, c.idClase, e.idObjeto" +
                " FROM enemigo e, clase c, objeto o " +
                "WHERE e.idClase = c.idClase and e.idObjeto=o.idObjeto and lower(e.nombre) like ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "%"+nombre+"%");

            try (ResultSet rs = pstmt.executeQuery()) {
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }
}
