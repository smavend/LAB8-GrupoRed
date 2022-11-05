package com.example.lab8.Servlet;

import com.example.lab8.Beans.Enemigo;
import com.example.lab8.Beans.Objeto;
import com.example.lab8.Daos.DaoEnemigos;
import com.example.lab8.Daos.DaoObjetos;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletFinalFantasy", urlPatterns = {"","/ServletFinalFantasy"})
public class ServletFinalFantasy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher requestDispatcher;

        DaoObjetos daoObjetos = new DaoObjetos();
        DaoEnemigos daoEnemigos = new DaoEnemigos();
        ArrayList<Objeto> listaObjetos = daoObjetos.getObjectList();
        ArrayList<Enemigo> listaEnemigos = daoEnemigos.listarEnemigos();
        Objeto objeto;
        if(action==null){
            RequestDispatcher view = request.getRequestDispatcher("home.jsp");
            view.forward(request,response);
        }
        else {
            switch (action){
                case "claseEnemigos":
                    requestDispatcher = request.getRequestDispatcher("clases.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "hechizos":
                    requestDispatcher = request.getRequestDispatcher("hechizos.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "objetos":
                    request.setAttribute("listaObjetos",listaObjetos);
                    requestDispatcher = request.getRequestDispatcher("objetos.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "newObject":
                    requestDispatcher = request.getRequestDispatcher("/ObjectsDependency/addObjects.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "borrarObject":  // JobServlet?action=borrarObject&id=50
                    String objectID = request.getParameter("id");
                    daoObjetos.deleteObject(objectID);
                    response.sendRedirect(request.getContextPath() + "/ServletFinalFantasy?action=objetos");
                    break;
                case "editObject":
                    String id = request.getParameter("id");
                    objeto = daoObjetos.getObjectbyId(id);

                    if (objeto != null) { //abro el form para editar
                        request.setAttribute("objeto", objeto);
                        requestDispatcher = request.getRequestDispatcher("/ObjectsDependency/editObject.jsp");
                        requestDispatcher.forward(request, response);
                    } else { //id no encontrado
                        response.sendRedirect(request.getContextPath() + "//ServletFinalFantasy?action=objetos");
                    }

                    requestDispatcher = request.getRequestDispatcher("/ObjectsDependency/editObjects.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "sortByid":
                    ArrayList<Objeto> listaByid = daoObjetos.getObjectListSortByID();
                    request.setAttribute("listaObjetos",listaByid);
                    requestDispatcher = request.getRequestDispatcher("objetos.jsp");
                    requestDispatcher.forward(request,response);
                    break;

                case "sortBynombre":
                    ArrayList<Objeto> listaByName = daoObjetos.getObjectListSortByname();
                    request.setAttribute("listaObjetos",listaByName);
                    requestDispatcher = request.getRequestDispatcher("objetos.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                case "sortBypeso":
                    ArrayList<Objeto> listaBypeso = daoObjetos.getObjectListSortBypeso();
                    request.setAttribute("listaObjetos",listaBypeso);
                    requestDispatcher = request.getRequestDispatcher("objetos.jsp");
                    requestDispatcher.forward(request,response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        DaoObjetos daoObjetos = new DaoObjetos();

        switch (action){
            case "guardar":
                String nombre = request.getParameter("nombre");
                String efecto = request.getParameter("efecto");
                String peso = request.getParameter("peso");
                if(daoObjetos.validarNombre(nombre)){
                    try {
                        float peso_f = Float.parseFloat(peso);
                        if (peso_f<0){
                            peso_f = peso_f*-1;
                        }
                        Objeto newObject = new Objeto();
                        newObject.setNombre(nombre);
                        newObject.setEfectoUso(efecto);
                        newObject.setPeso(peso_f);
                        daoObjetos.guardar(newObject);

                        response.sendRedirect(request.getContextPath() + "/ServletFinalFantasy?action=objetos");

                    } catch (NumberFormatException e) {
                        response.sendRedirect(request.getContextPath() + "/ServletFinalFantasy?action=newObject");
                    }
                }
                else {
                    response.sendRedirect(request.getContextPath() + "/ServletFinalFantasy?action=newObject");
                }
                break;
            case "actualizar":
                String idObject = request.getParameter("idObject");
                String nombre_up = request.getParameter("nombre");
                String efecto_up = request.getParameter("efecto");
                String peso_up = request.getParameter("peso");
                try {
                    int id = Integer.parseInt(idObject);
                    float peso_upf = Float.parseFloat(peso_up);
                    daoObjetos.updateObject(id,nombre_up,efecto_up,peso_upf);
                    response.sendRedirect(request.getContextPath() + "/ServletFinalFantasy?action=objetos");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/ServletFinalFantasy?action=editObject&id=" + idObject);
                }
                break;
            case "buscar":
                String searchText = request.getParameter("searchText");

                ArrayList<Objeto> lista = daoObjetos.searchByName(searchText);

                request.setAttribute("listaObjetos", lista);
                request.setAttribute("searchText",searchText);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("objetos.jsp");
                requestDispatcher.forward(request, response);

                break;
        }
    }
}
