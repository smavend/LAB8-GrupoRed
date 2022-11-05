package com.example.lab8.Servlet;

import com.example.lab8.Beans.Heroes;
import com.example.lab8.Beans.Objeto;
import com.example.lab8.Daos.DaoHeroes;
import com.example.lab8.Daos.DaoObjetos;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletHeroe", urlPatterns = {"/ServletHeroe","/Heroes"})
public class ServletHeroe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        id = (id == null) ? "heroe" : id;
        RequestDispatcher requestDispatcher;

        DaoHeroes daoHeroes = new DaoHeroes();
        ArrayList<Heroes> listaHeroes = daoHeroes.getHeroesList();

        switch (id){
            case "heroe":
                System.out.println("nombre: " + listaHeroes.get(0).getNombre());
                request.setAttribute("listaHeroes",listaHeroes);
                requestDispatcher = request.getRequestDispatcher("heroes.jsp");
                requestDispatcher.forward(request,response);
                break;
            case"newHero":
                requestDispatcher = request.getRequestDispatcher("/HeroDependency/addHero.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "deleteHero":
                System.out.println("Borrando heroe");
                break;
            case "inventario":
                System.out.println("Inventario Heroe");
                break;
            case "editHero":
                System.out.println("Eduicioon");
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LLEGA");
        String id = request.getParameter("id");
        DaoHeroes daoHeroes = new DaoHeroes();
        switch (id){
            case "guardar":
                System.out.println("ENTRA A CASE");
                String nombre = request.getParameter("nombre");
                String age = request.getParameter("edad");
                String genero = request.getParameter("genero");
                String clase = request.getParameter("clase");
                String nvI = request.getParameter("nivelInicial");
                String atq = request.getParameter("ataque");
                String pareja = request.getParameter("pareja");
                System.out.println("last " + nombre);
                    try {
                        System.out.println("Entra a TRY");
                        int  edad = Integer.parseInt(age);
                        int nivelInicial = Integer.parseInt(nvI);
                        int ataque = Integer.parseInt(atq);
                        int idParjea = Integer.parseInt(pareja);
                        Heroes newHero = new Heroes();
                        newHero.setNombre(nombre);
                        newHero.setEdad(edad);
                        newHero.setGenero(genero);
                        newHero.setNivelInicial(nivelInicial);
                        newHero.setAtaque(ataque);
                        newHero.setClase(clase);
                        newHero.setIdPareja(idParjea);
                        newHero.setExperiencia(daoHeroes.getExp(nivelInicial));

                        daoHeroes.guardar(newHero);
                        System.out.println("GUARDA");
                        response.sendRedirect(request.getContextPath() + "/ServletHeroe");

                    } catch (NumberFormatException e) {
                        System.out.println("ENTRA CATCH");
                        response.sendRedirect(request.getContextPath() + "/ServletHeroe?id=newHero");
                    }
                break;
        }

    }
}
