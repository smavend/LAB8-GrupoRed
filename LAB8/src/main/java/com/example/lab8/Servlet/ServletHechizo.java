package com.example.lab8.Servlet;

import com.example.lab8.Beans.Hechizo;
import com.example.lab8.Daos.DaosHechizos;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletHechizo", value = "/ServletHechizo")
public class ServletHechizo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        DaosHechizos hechizoDao = new DaosHechizos();
        RequestDispatcher view;

        switch (action) {
            case "listar":
                ArrayList<Hechizo> listaHechizo = hechizoDao.obtenerListaTrabajos();
                request.setAttribute("lista", listaHechizo);

                view = request.getRequestDispatcher("hechizos.jsp");
                view.forward(request, response);
                break;
            case "añadir":
                view = request.getRequestDispatcher("añadirHechizo.jsp");
                view.forward(request, response);
                break;
            case "borrar":
                String hechizoID = request.getParameter("id");
                if(hechizoDao.obtenerHechizo(hechizoID) != null){
                    hechizoDao.borrarHechizo(hechizoID);
                }
                response.sendRedirect(request.getContextPath() + "/Servlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
