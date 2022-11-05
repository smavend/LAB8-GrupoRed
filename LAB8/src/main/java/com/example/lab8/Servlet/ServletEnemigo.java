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
        ArrayList<Enemigo> listaEnemigos = daoEnemigos.listarEnemigos();
        Enemigo e = null;

        switch (id){
            case "inicio":
                request.setAttribute("listaEnemigos",listaEnemigos);
                requestDispatcher = request.getRequestDispatcher("enemigos.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "vistaAdd":
                requestDispatcher = request.getRequestDispatcher("EnemysDependency/addEnemigo.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "edit":
                String enemy = request.getParameter("enemy");
                e = daoEnemigos.buscarId(enemy);

                if(e!=null){
                    request.setAttribute("enemy", e);
                    request.setAttribute("listaEnemigos", listaEnemigos);
                    
                    requestDispatcher = request.getRequestDispatcher("EnemysDependency/editEnemigo.jsp");
                    requestDispatcher.forward(request, response);
                }
                else{
                    response.sendRedirect(request.getContextPath()+"/Enemigos");
                }
                break;
            case "clase":
                requestDispatcher = request.getRequestDispatcher("clases.jsp");
                requestDispatcher.forward(request,response);
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
