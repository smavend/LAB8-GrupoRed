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
