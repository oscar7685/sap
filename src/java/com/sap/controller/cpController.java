/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.interfaz.Action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author 2013
 */
public class cpController extends HttpServlet {

    private final Logger LOGGER = Logger.getLogger(cpController.class);

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            ResourceBundle rb = ResourceBundle.getBundle("properties/actions");
            String action = request.getParameter("action");
            String clase;
            clase = rb.getString(action);
            Action objeto = (Action) Class.forName(clase).newInstance();

            String ruta = objeto.procesar(request);
            int longitudRuta = ruta.length();
            if (longitudRuta > 2) {
                if (ruta.contains("{")) {
                    response.setContentType("application/json");
                    out.print(ruta);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher(ruta);
                    rd.forward(request, response);
                }

            } else if (longitudRuta == 2) {
                //NO pasa nada
            } else if (longitudRuta == 1) {
                out.print(ruta);
            }

        } catch (Exception e) {
            LOGGER.error("Se ha presentado un error", e);
            RequestDispatcher rd = request.getRequestDispatcher("error404.html");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
