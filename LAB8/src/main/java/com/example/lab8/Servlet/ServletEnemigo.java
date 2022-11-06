package com.example.lab8.Servlet;

import com.example.lab8.Beans.Clase;
import com.example.lab8.Beans.Enemigo;
import com.example.lab8.Beans.Objeto;
import com.example.lab8.Daos.DaoClase;
import com.example.lab8.Daos.DaoEnemigos;
import com.example.lab8.Daos.DaoObjetos;
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
        DaoClase daoClase = new DaoClase();
        DaoObjetos daoObjetos = new DaoObjetos();
        ArrayList<Clase> listaClases = daoClase.listarClases();
        ArrayList<Objeto> listaObjetos = daoObjetos.getObjectList();
        ArrayList<Enemigo> listaEnemigos = daoEnemigos.listarEnemigos();
        Enemigo e;

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
            case "vistaEdit":
                String enemy = request.getParameter("enemy");
                e = daoEnemigos.buscarId(enemy);

                if(e!=null){
                    request.setAttribute("enemy", e);
                    request.setAttribute("listaEnemigos", listaEnemigos);
                    request.setAttribute("listaClases", listaClases);
                    request.setAttribute("listaClases", listaClases);

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
        String post = request.getParameter("post");
        DaoEnemigos daoEnemigos = new DaoEnemigos();

        switch (post){
            case "edit":
                String idEnemigoStr = request.getParameter("idEnemigo");
                String nombre = request.getParameter("nombre");
                String claseStr = request.getParameter("clase");
                String ataqueStr = request.getParameter("ataque");
                String experienciaStr = request.getParameter("experiencia");
                String objetoStr = request.getParameter("objeto");
                String probObjetoStr = request.getParameter("probObjeto");
                String genero = request.getParameter("genero");
                try {
                    int ataque = Integer.parseInt(ataqueStr);
                    int experiencia = Integer.parseInt(experienciaStr);
                    float probObjeto = Float.parseFloat(probObjetoStr);
                    int idEnemigo = Integer.parseInt(idEnemigoStr);
                    int clase = Integer.parseInt(claseStr);
                    int objeto = Integer.parseInt(objetoStr);
                    if(ataque>0 & experiencia>0){
                        if(daoEnemigos.editar(idEnemigo, nombre, clase, ataque, experiencia, objeto, probObjeto, genero)){
                            response.sendRedirect(request.getContextPath() + "/Enemigos");
                        }
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/Enemigo?id=vistaEdit&enemy=" + idEnemigoStr);
                }
                break;
        }
    }
}
