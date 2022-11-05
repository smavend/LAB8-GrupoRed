package com.example.lab8.Servlet;

import com.example.lab8.Beans.Heroes;
import com.example.lab8.Daos.DaoHeroes;
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
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
