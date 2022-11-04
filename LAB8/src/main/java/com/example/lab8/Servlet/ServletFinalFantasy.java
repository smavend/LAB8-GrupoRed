package com.example.lab8.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletFinalFantasy", urlPatterns = {"","/ServletFinalFantasy"})
public class ServletFinalFantasy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;
        if(action==null){
            RequestDispatcher view = request.getRequestDispatcher("home.jsp");
            view.forward(request,response);
        }
        else {
            switch (action){
                case "enemigos":
                    requestDispatcher = request.getRequestDispatcher("enemigos.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "claseEnemigos":
                    requestDispatcher = request.getRequestDispatcher("clases.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "heroes":
                    requestDispatcher = request.getRequestDispatcher("heroes.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "hechizos":
                    requestDispatcher = request.getRequestDispatcher("hechizos.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "objetos":
                    requestDispatcher = request.getRequestDispatcher("objetos.jsp");
                    requestDispatcher.forward(request,response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
