package com.example.lab8.Servlet;

import com.example.lab8.Beans.Clase;
import com.example.lab8.Beans.Enemigo;
import com.example.lab8.Beans.Estadistica;
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
        String enemy;
        Enemigo enemigo;

        switch (id){
            case "inicio":
                request.setAttribute("listaEnemigos",listaEnemigos);
                request.setAttribute("estadistica", daoEnemigos.obtenerEstadGenero(daoEnemigos.obtenerEstadObjeto(daoEnemigos.obtenerEstadClase())));
                requestDispatcher = request.getRequestDispatcher("enemigos.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "vistaAdd":
                request.setAttribute("listaClases", listaClases);
                request.setAttribute("listaObjetos", listaObjetos);
                requestDispatcher = request.getRequestDispatcher("EnemysDependency/addEnemigo.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "vistaEdit":
                enemy = request.getParameter("enemy");
                enemigo = daoEnemigos.buscarId(enemy);

                if(enemigo !=null){
                    request.setAttribute("enemy", enemigo);
                    request.setAttribute("listaEnemigos", listaEnemigos);
                    request.setAttribute("listaClases", listaClases);
                    request.setAttribute("listaObjetos", listaObjetos);

                    requestDispatcher = request.getRequestDispatcher("EnemysDependency/editEnemigo.jsp");
                    requestDispatcher.forward(request, response);
                }
                else{
                    response.sendRedirect(request.getContextPath()+"/Enemigos");
                }
                break;
            case "delete":
                enemy = request.getParameter("enemy");
                daoEnemigos.borrar(Integer.parseInt(enemy));
                response.sendRedirect(request.getContextPath()+"/Enemigos");
                break;
            case "clase":
                request.setAttribute("clases", daoClase.listarClases());
                requestDispatcher = request.getRequestDispatcher("clases.jsp");
                requestDispatcher.forward(request,response);
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String post = request.getParameter("post");
        DaoEnemigos daoEnemigos = new DaoEnemigos();
        RequestDispatcher requestDispatcher;
        Enemigo enemigo;

        switch (post){
            case "edit":
                enemigo = new Enemigo();
                try {
                    enemigo.setIdEnemigo(Integer.parseInt(request.getParameter("idEnemigo")));
                    enemigo.setNombre(request.getParameter("nombre"));
                    enemigo.setIdClase(Integer.parseInt(request.getParameter("clase")));
                    enemigo.setIdObjeto(Integer.parseInt(request.getParameter("idObjeto")));
                    enemigo.setGenero(request.getParameter("genero"));
                    int ataque = Integer.parseInt(request.getParameter("ataque"));
                    int experiencia = Integer.parseInt(request.getParameter("experiencia"));
                    float probObjeto = Float.parseFloat(request.getParameter("probObjeto"));

                    enemigo.setAtaque((ataque<0)?(-ataque):ataque);
                    enemigo.setExperiencia((experiencia<0)?(-experiencia):experiencia);
                    enemigo.setProbObjeto((probObjeto<0)?(-probObjeto):probObjeto);
                    if (daoEnemigos.editar(enemigo)) {
                        response.sendRedirect(request.getContextPath() + "/Enemigos");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/Enemigos?id=vistaEdit&enemy=" + request.getParameter("idEnemigo"));
                    }
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath() + "/Enemigos?id=vistaEdit&enemy=" + request.getParameter("idEnemigo"));
                }
                break;
            case "add":
                enemigo = new Enemigo();
                enemigo.setNombre(request.getParameter("nombre"));
                enemigo.setIdClase(Integer.parseInt(request.getParameter("clase")));
                enemigo.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                enemigo.setExperiencia(Integer.parseInt(request.getParameter("experiencia")));
                enemigo.setIdObjeto(Integer.parseInt(request.getParameter("idObjeto")));
                enemigo.setProbObjeto(Float.parseFloat(request.getParameter("probObjeto")));
                enemigo.setGenero(request.getParameter("genero"));
                if(daoEnemigos.agregar(enemigo)){
                    response.sendRedirect(request.getContextPath() + "/Enemigos");
                }else{
                    response.sendRedirect(request.getContextPath() + "/Enemigos?post=add");
                }
                break;
        }
    }
}
