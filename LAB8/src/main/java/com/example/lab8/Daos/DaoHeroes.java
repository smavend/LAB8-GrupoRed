package com.example.lab8.Daos;

import com.example.lab8.Beans.Heroes;
import com.example.lab8.Beans.Objeto;

import java.sql.*;
import java.util.ArrayList;

public class DaoHeroes {
    public ArrayList<Heroes> getHeroesList() {
        ArrayList<Heroes> heroesList = new ArrayList<>();
        try {
            String user = "root";
            String passw = "root";
            String url = "jdbc:mysql://localhost:3306/grupored";
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url, user, passw);
            Statement statement = connection.createStatement();
            String sql = "select * from heroe";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Heroes newHero = new Heroes();
                newHero.setIdHeroe(rs.getInt(1));
                newHero.setIdPareja(rs.getInt(2));
                newHero.setNombre(rs.getString(3));
                newHero.setEdad(rs.getInt(4));
                newHero.setGenero(rs.getString(5));
                newHero.setClase(rs.getString(6));
                newHero.setNivelInicial(rs.getInt(7));
                newHero.setAtaque(rs.getInt(8));
                newHero.setExperiencia(getExp(newHero.getNivelInicial()));
                heroesList.add(newHero);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return heroesList;
    }

    public void guardar(Heroes hero) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "INSERT INTO heroe (idPareja,nombre,edad,genero,clase,nivelInicial,ataque) VALUES (?,?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,hero.getIdPareja());
            pstmt.setString(2, hero.getNombre());
            pstmt.setInt(3,hero.getEdad());
            pstmt.setString(4,hero.getGenero());
            pstmt.setString(5,hero.getClase());
            pstmt.setInt(6,hero.getNivelInicial());
            pstmt.setInt(7,hero.getAtaque());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void deleteHero(int heroid) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "DELETE FROM heroe WHERE idHeroe = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,heroid);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getExp(int n){
        int exp=0;
        if(n<=15){
            exp = (n*n*n)*(24+(n+1)/3)/50;
        } else if (16<=n && n<=35){
            exp = (n*n*n)*(14+n)/50;
        } else if (36<=n && n<=100) {
            exp = (n*n*n)*(32+(n/2))/50;
        }
        return exp;
    }

}
