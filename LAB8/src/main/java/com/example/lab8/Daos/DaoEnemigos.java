package com.example.lab8.Daos;

import com.example.lab8.Beans.Enemigo;
import com.example.lab8.Beans.Objeto;

import java.sql.*;
import java.util.ArrayList;

public class DaoEnemigos {
    public ArrayList<Enemigo> listarEnemigos() {
        ArrayList<Enemigo> lista = new ArrayList<>();
        try{
            String user = "root";
            String pasw = "root";
            String url = "jdbc:mysql://localhost:3306/grupored";
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url, user, pasw);
            Statement statement = connection.createStatement();
            String sql = "SELECT e.nombre, c.nombre, ataque, experiencia, o.nombre, probObjeto, genero" +
                    " FROM enemigo e, clase c, objeto o "+
                    "WHERE e.idClase = c.idClase and e.idObjeto=o.idObjeto";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Enemigo enemigo = new Enemigo();
                enemigo.setNombre(rs.getString(1));
                enemigo.setClase(rs.getString(2));
                enemigo.setAtaque(rs.getInt(3));
                enemigo.setExperiencia(rs.getInt(4));
                enemigo.setObjetoDado(rs.getString(5));
                enemigo.setProbObjeto(rs.getFloat(6));
                enemigo.setGenero(rs.getString(7));

                lista.add(enemigo);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
