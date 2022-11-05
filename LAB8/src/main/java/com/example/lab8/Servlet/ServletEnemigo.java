package com.example.lab8.Servlet;

import com.example.lab8.Beans.Enemigo;
import com.example.lab8.Daos.DaoEnemigos;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletEnemigo", urlPatterns = {"/Enemigos","/Enemigo","/ServletEnemigo"})
public class ServletEnemigo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        id = (id == null) ? "inicio" : id;
        RequestDispatcher requestDispatcher;
        DaoEnemigos daoEnemigos = new DaoEnemigos();
        ArrayList<Enemigo> listaEnemigos = new ArrayList<>();

        switch (id){
            case "inicio":
                request.setAttribute("listaEnemigos",daoEnemigos.listarEnemigos());
                requestDispatcher = request.getRequestDispatcher("enemigos.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "vistaAdd":
                requestDispatcher = request.getRequestDispatcher("/EnemysDependency/addEnemigo.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "clase":
                requestDispatcher = request.getRequestDispatcher("clases.jsp");
                requestDispatcher.forward(request,response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
